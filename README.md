# PDFtoText
Simple Converter (pdf->Image->Text) using OCR (Optical Character Recognition)

### required:
- tesseract via `brew install tesseract`
- pdftoppm via `brew install poppler`

### Workflow explained:
1. copy pdf one your desktop
2. open Terminal
3. move to PDFtoText converter directory
4. convert via `./script.sh <PDF-Filename> <language>`

Note:
- only insert the name of the pdf-file without the suffix `.pdf`
- for languages you can use one e.g. like `eng` for english optimization or multiple like `eng+deu` for english and german optimization (for further see the tesseract docs:
https://tesseract-ocr.github.io/tessdoc/Command-Line-Usage.html)

### Specs (so far best working for me):
- Image: jpeg image-format and dpi of 400 `pdftoppm -jpeg -r 400`
- Tesseract: default mode proofed to be the best working `--psm 3`
