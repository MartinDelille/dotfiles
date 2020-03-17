#!/bin/bash

ffmpeg -i $1 -filter:v "select='gt(scene,0.4)',showinfo" -f null - \
    2| grep showinfo \
#    | grep pts_time:[0-9.]* -o | \

