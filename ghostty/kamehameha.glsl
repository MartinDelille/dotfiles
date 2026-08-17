// kamehameha.glsl -- Ghostty cursor shader
//
// Fires a turbulent blue-white ki beam from the previous cursor position to the
// new one: a white-hot core wrapped in cyan plasma and a deep blue aura, with a
// bright orb leading the blast and a permanent charged glow around the cursor.
//
// The beam is a capsule whose live section grows from the tail toward the head,
// displaced sideways by fbm noise so the edges churn instead of sitting still.

const float DURATION = 0.42; // total lifetime of the blast, in seconds
const float FIRE     = 0.28; // fraction of DURATION the head takes to arrive
const float BEAM     = 0.42; // beam radius, in cursor heights
const float AURA     = 0.55; // charged aura radius, in cursor heights

const vec3 C_OUTER = vec3(0.04, 0.13, 0.78);
const vec3 C_MID   = vec3(0.16, 0.58, 1.00);
const vec3 C_INNER = vec3(0.68, 0.95, 1.00);
const vec3 C_CORE  = vec3(1.00, 1.00, 1.00);

// Map pixels to a -1..1 space on Y (isPosition = 1 for points, 0 for sizes).
vec2 norm(vec2 value, float isPosition) {
    return (value * 2.0 - (iResolution.xy * isPosition)) / iResolution.y;
}

// Ghostty gives cursor rects as (left, top, width, height) with Y up.
vec2 rectCenter(vec4 r) {
    return vec2(r.x + r.z * 0.5, r.y - r.w * 0.5);
}

float sdBox(vec2 p, vec2 c, vec2 h) {
    vec2 d = abs(p - c) - h;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

float hash21(vec2 p) {
    p = fract(p * vec2(233.34, 851.73));
    p += dot(p, p + 23.45);
    return fract(p.x * p.y);
}

float vnoise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    float a = hash21(i);
    float b = hash21(i + vec2(1.0, 0.0));
    float c = hash21(i + vec2(0.0, 1.0));
    float d = hash21(i + vec2(1.0, 1.0));
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

float fbm(vec2 p) {
    float v = 0.0;
    float a = 0.5;
    for (int i = 0; i < 4; i++) {
        v += a * vnoise(p);
        p *= 2.07;
        a *= 0.5;
    }
    return v;
}

// Energy ramp: cold blue at the fringe, white hot in the middle.
vec3 plasma(float e) {
    vec3 c = mix(C_OUTER, C_MID, smoothstep(0.05, 0.40, e));
    c = mix(c, C_INNER, smoothstep(0.35, 0.72, e));
    c = mix(c, C_CORE, smoothstep(0.70, 0.96, e));
    return c;
}

// Screen blend so overlapping layers glow instead of clipping to flat white.
vec3 addGlow(vec3 base, float e) {
    e = clamp(e, 0.0, 1.0);
    vec3 g = plasma(e) * e;
    return 1.0 - (1.0 - base) * (1.0 - g);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec3 base = texture(iChannel0, fragCoord / iResolution.xy).rgb;
    vec2 p = norm(fragCoord, 1.0);

    vec4 cur = vec4(norm(iCurrentCursor.xy, 1.0), norm(iCurrentCursor.zw, 0.0));
    vec4 prv = vec4(norm(iPreviousCursor.xy, 1.0), norm(iPreviousCursor.zw, 0.0));

    vec2 src = rectCenter(prv);
    vec2 dst = rectCenter(cur);
    float cell = max(cur.w, 1e-4); // cursor height is the unit for every radius

    float progress = clamp((iTime - iTimeCursorChange) / DURATION, 0.0, 1.0);
    float head = smoothstep(0.0, FIRE, progress);         // leading edge, 0 -> 1
    float tail = smoothstep(FIRE * 1.15, 1.0, progress);  // trailing edge follows
    float fade = 1.0 - smoothstep(0.72, 1.0, progress);

    vec2 axis = dst - src;
    float len = length(axis);
    float hasBeam = step(cell * 0.2, len) * fade;
    vec2 dir = axis / max(len, 1e-5);
    vec2 side = vec2(-dir.y, dir.x);

    // Beam-local coordinates: s along the axis, t normalized 0..1.
    float s = dot(p - src, dir);
    float t = s / max(len, 1e-5);

    // Churning sideways displacement + thickness modulation.
    float wobble = (fbm(vec2(t * 5.0 - iTime * 5.0, 17.3)) - 0.5) * cell * 0.5;
    float flow = fbm(vec2(t * 8.0 - iTime * 9.0, dot(p - src, side) * 22.0));

    // Distance to the currently live slice of the capsule; the clamp gives
    // rounded caps at both the trailing and the leading end for free.
    vec2 pw = p - side * wobble;
    float sc = clamp(dot(pw - src, dir), tail * len, head * len);
    float d = length(pw - (src + dir * sc));

    float taper = mix(0.7, 1.2, smoothstep(0.0, 0.9, t));
    float rad = cell * BEAM * taper * (0.6 + 0.75 * flow);

    float beam = pow(exp(-d / rad), 1.3);
    beam += smoothstep(rad * 0.85, rad * 0.15, d) * 0.85;      // white-hot core
    beam += pow(max(0.0, 1.0 - abs(d - rad * 1.7) / (cell * 0.16)), 3.0)
            * step(0.58, flow) * 0.5;                          // crackling edge

    // Orb riding the leading edge, still hot while the beam is in flight.
    vec2 orbAt = src + dir * (head * len);
    float orbR = cell * 0.6 * (1.0 + 0.14 * sin(iTime * 34.0)) * (1.0 - 0.5 * tail);
    float orb = exp(-length(p - orbAt) / orbR) * 1.2;

    // Charged ki permanently gathered around the cursor itself.
    float dcur = max(sdBox(p, dst, cur.zw * 0.5), 0.0);
    float halo = 0.72 + 0.18 * sin(iTime * 15.0)
                 + 0.22 * fbm(vec2(atan(p.y - dst.y, p.x - dst.x + 1e-6) * 2.2, iTime * 2.5));
    float aura = exp(-dcur / (cell * AURA * halo)) * (0.5 + 0.45 * fade);

    vec3 col = base;
    col = addGlow(col, beam * hasBeam);
    col = addGlow(col, orb * hasBeam);
    col = addGlow(col, aura);

    fragColor = vec4(col, 1.0);
}
