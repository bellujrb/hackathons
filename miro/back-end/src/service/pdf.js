const fs = require("fs");
const PDFDocument = require("pdf-lib").PDFDocument;
const pdfParse = require("pdf-parse");

class PDF_Reader {
  async extractPages(pdfPath, pageNumbersToKeep) {
    try {
      const pageSlices = pageNumbersToKeep.split(",").map(Number);

      if (pageSlices.length > 3) {
        throw new Error("Too many pages, the max is 3 Pages.");
      }

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
        if (pageSlices.includes(i + 1)) {
          pagesItContent.push(text);
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

  async arrayForText(array) {
    try {
      let textNew = "";
      for (let i = 0; i <= array.length - 1; i++) {
        textNew += array[i];
      }
      return textNew;
    } catch (error) {
      throw error;
    }
  }
}

module.exports = { PDF_Reader };
