#!/bin/bash
echo "Merging PDF:"

if [ "$#" -ge 8 ]; then
  echo "Doesn't handle more than 5 arguments!"
  echo "Usage: merge-pdf.sh <output.pdf> <input1.pdf> <input2.pdf> ..."
  exit 1
else
  #ffmpeg -i $1 -c:v mjpeg -q:v 5 -metadata timecode=$4 -r $3 $2
  gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$1 $2 $3 $4 $5 $6 $7 $8
fi

