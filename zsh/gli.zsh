# gli - GitLab CI Jobs interactive viewer
# Displays all jobs from the current branch's pipeline with fzf

gli() {
  # Get current branch
  local branch
  branch=$(git branch --show-current 2>/dev/null)
  if [[ -z "$branch" ]]; then
    echo "Error: Not in a git repository or no branch checked out" >&2
    return 1
  fi

  # Fetch pipeline with job details
  local pipeline_json
  pipeline_json=$(glab ci get -b "$branch" --with-job-details -F json 2>/dev/null)
  # DEBUG: Show raw output from glab (removed for production)
  if ! printf '%s' "$pipeline_json" | jq empty 2>/dev/null; then
    echo "Error: Invalid JSON received from glab" >&2
    return 1
  fi
  if [[ -z "$pipeline_json" || "$pipeline_json" == "null" ]]; then
    echo "Error: No pipeline found for branch '$branch'" >&2
    return 1
  fi

  # Parse jobs and format for fzf (simplified)
  local jobs_list
  jobs_list=$(printf '%s' "$pipeline_json" | jq -r '.jobs[] | "\(.id) \(.name) \(.status)"')


  if [[ -z "$jobs_list" ]]; then
    echo "Error: No jobs found in pipeline" >&2
    return 1
  fi

  # Select job with fzf
  local selected
  selected=$(echo "$jobs_list" | fzf \
    --header="GitLab CI Jobs - $branch (Enter: view logs)" \
    --preview "op plugin run -- glab ci trace {1}")
  if [[ -n "$selected" ]]; then
    local job_id
    job_id=$(echo "$selected" | awk '{print $1}')
    if [[ -n "$job_id" ]]; then
      glab ci trace "$job_id"
    fi
  fi

  # --- Commented out advanced formatting and preview ---
  # local header="ID|ST|STAGE|NAME|STATUS|DURATION|STARTED"
  # ... color formatting, emoji, preview, etc ...
}
