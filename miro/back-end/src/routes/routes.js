const express = require("express");
const multer = require("multer");

const { PDF_Reader } = require("../service/pdf");
const { GPT } = require("../service/gpt");
const { PDF_Search } = require("../service/search");

const router = express.Router();
const storage = multer.diskStorage({
  destination: "./pdfsFiles",
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});
const upload = multer({ storage: storage });

const servicePDF = new PDF_Reader();
const serviceGPT = new GPT();
const serviceSearch = new PDF_Search();

router.post("/resume-pdf", upload.single("pdf"), async (req, res) => {
  try {
    const uploadedPdfPath = req.file.path;
    const { page } = req.headers;
    if (page && uploadedPdfPath) {
      const array = await servicePDF.extractPages(uploadedPdfPath, page);
      const text = await servicePDF.arrayForText(array);
      const response = await serviceGPT.gptResume(text);

      res.status(200).json({ message: response });
    } else {
      throw new Error("Pdf Invalid");
    }
  } catch (error) {
    res.status(500).json({ error: "Internal error in pdf." });
  }
});

router.post("/diagram", upload.single("pdf"), async (req, res) => {
  try {
    const uploadedPdfPath = req.file.path;
    const { page } = req.headers;
    if (page && uploadedPdfPath) {
      const array = await servicePDF.extractPages(uploadedPdfPath, page);
      const text = await servicePDF.arrayForText(array);
      const response = await serviceGPT.gptDiagram(text);

      res.status(200).json({ message: response });
    } else {
      throw new Error("Pdf Invalid");
    }
  } catch (error) {
    res.status(500).json({ error: "Internal error in pdf." });
  }
});

router.post("/word-search", upload.single("pdf"), async (req, res) => {
  const uploadedPdfPath = req.file.path;
  try {
    const { word } = req.headers;
    const result = await serviceSearch.extractPageWithContentWord(
      uploadedPdfPath,
      word
    );
    res.status(200).json({ message: result });
  } catch (error) {
    res.status(500).json({ error: "Internal error in pdf." });
  }
});

module.exports = router;
