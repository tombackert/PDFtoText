#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <sub_directory> <language>"
    exit 1
fi

PARENT_DIR="/Users/tom.backert/Desktop/ocr_input"
SUB_DIR="$1"
LANG="$2"

INPUT_DIR="${PARENT_DIR}/${SUB_DIR}"
OUTPUT="/Users/tom.backert/Desktop/ocr_output/${SUB_DIR}_output.txt"

# Create the output directory if it does not exist
mkdir -p "/Users/tom.backert/Desktop/ocr_output/"

# Loop over every image in the directory
for IMAGE in "$INPUT_DIR"/*.{tif,tiff}; do
   tesseract "$IMAGE" stdout -l "$LANG" >> "$OUTPUT"
done