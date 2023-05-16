#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <pdf_file_name>"
    exit 1
fi

PDF_NAME="$1"
PDF_PATH="/Users/tom.backert/Desktop/${PDF_NAME}.pdf"

# Path to the output directory
OUTPUT_DIR="/Users/tom.backert/Desktop/ocr_input/${PDF_NAME}"

# Create the output directory if it does not exist
mkdir -p "$OUTPUT_DIR"

# Convert the PDF to images and save them in the output directory
pdftoppm -tiff -r 600 "$PDF_PATH" "$OUTPUT_DIR/$PDF_NAME"
