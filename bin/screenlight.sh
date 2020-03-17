#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Illegal number of parameters"
  echo "Usage: convert-to-mjpeg input_file output_file frame_rate timestamp"
  exit 1
else
  ffmpeg -i $1 -map 0:v -map 0:a -c:v libx264 -g 12 -keyint_min 12 $2
fi

