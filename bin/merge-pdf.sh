#!/bin/bash
echo "Merging PDF:"

if [ "$#" -le 2 ]; then
  echo "Please provide at least 3 arguments!"
  echo "Usage: merge-pdf.sh <output.pdf> <input1.pdf> <input2.pdf> ..."
  exit 1
fi

if [ "$#" -ge 8 ]; then
  echo "Doesn't handle more than 5 arguments!"
  echo "Usage: merge-pdf.sh <output.pdf> <input1.pdf> <input2.pdf> ..."
  exit 1
fi

/opt/homebrew/opt/ghostscript/bin/gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$1 $2 $3 $4 $5 $6 $7 $8
