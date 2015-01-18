#!/bin/bash

if [ "$#" -ne 4 ]; then
  echo "Illegal number of parameters"
  echo "Usage: convert-to-mjpeg input_file output_file frame_rate timestamp"
else
  ffmpeg -i $1 -vcodec mjpeg -q:v 5 -metadata timecode=$4 -r $3 $2
fi

