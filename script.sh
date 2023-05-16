#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <pdf_file_name> <language>"
    exit 1
fi

PDF_NAME="$1"
LANG="$2"

# Pfad zur PDF-Datei auf dem Desktop
PDF_PATH="/Users/tom.backert/Desktop/${PDF_NAME}.pdf"

# Pfad zum Ordner "PDFtoText" für den gesamten Vorgang
WORKFLOW_DIR="/Users/tom.backert/Projekte/PDFtoText/Workflow"

# Pfad zum Ausgabeordner für die Bilder
OUTPUT_DIR="${WORKFLOW_DIR}/${PDF_NAME}"

# Pfad zur Ausgabedatei auf dem Desktop
OUTPUT="/Users/tom.backert/Desktop/${PDF_NAME}_ocr_output.txt"

# Erstellen des Ausgabeordners und des Workflows-Ordners, falls sie nicht existieren
mkdir -p "$OUTPUT_DIR"
mkdir -p "$WORKFLOW_DIR"

# Konvertieren der PDF in TIFF-Bilder und Speichern im Ausgabeordner
pdftoppm -tiff -r 300 "$PDF_PATH" "$OUTPUT_DIR/$PDF_NAME"

# Loop über jedes Bild im Ausgabeordner und OCR durchführen
for IMAGE in "$OUTPUT_DIR"/*.{tif,tiff}; do
    echo "Processing image: $IMAGE"
    tesseract "$IMAGE" stdout -l "$LANG" >> "$OUTPUT"
done

# Löschen der Bilder im Ausgabeordner
rm -rf "$OUTPUT_DIR"