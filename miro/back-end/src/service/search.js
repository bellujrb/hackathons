const fs = require("fs");
const PDFDocument = require("pdf-lib").PDFDocument;
const pdfParse = require("pdf-parse");

class PDF_Search {
  async extractPageWithContentWord(pdfPath, word) {
    try {
      const documentAsBytes = await fs.promises.readFile(pdfPath);

      const pdfDoc = await PDFDocument.load(documentAsBytes);
      const pagesItContent = [];
      const numberOfPages = pdfDoc.getPageCount();

      for (let i = 0; i < numberOfPages; i++) {
        const subDocument = await PDFDocument.create();

        const copiedPage = await subDocument.copyPages(pdfDoc, [i]);
        subDocument.addPage(copiedPage[0]);

        const pdfBytes = await subDocument.save();
        const text = await this.getPageText(pdfBytes);
        if (text.includes(word)) {
          pagesItContent.push({ text: text, originalPage: i + 1 });
        }
      }
      return pagesItContent;
    } catch (error) {
      throw new Error(`Error splitting PDF: ${error.message}`);
    }
  }

  async getPageText(pdfBytes) {
    const pdfData = await pdfParse(pdfBytes);
    const pdfText = pdfData.text;
    const pdfClear = pdfText.replace(/\n/g, " ");
    return pdfClear;
  }
}

module.exports = { PDF_Search };
