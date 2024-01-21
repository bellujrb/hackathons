const axios = require("axios");
require("dotenv").config();

const key = process.env.GPT;
class GPT {
  async gptResume(message) {
    try {
      const response = await axios.post(
        "https://api.openai.com/v1/chat/completions",
        {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: "You are a helpful assistant." },
            {
              role: "user",
              content: `JUST SUMMARIZE AND DON'T TEACH HOW TO SUMMARIZE, Give me a summary in 10 parts of 50 words: ${message}`,
            },
          ],
        },
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${key}`,
          },
        }
      );

      const res = response.data.choices[0].message.content;
      const cleanedText = res.trim().replace(/^"|"$/g, "");
      const clearNumber = cleanedText.replace(/\d+\./g, "");
      const lines = clearNumber.split("\n");

      return lines;
    } catch (error) {
      throw new Error("Error sending chat request:", error);
    }
  }
  async gptDiagram(message) {
    try {
      const response = await axios.post(
        "https://api.openai.com/v1/chat/completions",
        {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: "You are a helpful assistant." },
            {
              role: "user",
              content: `Summarize this in several steps 1, 2, 3, 4... and so on, as you would explain in a flowchart ${message} summary (max 20 steps)`,
            },
          ],
        },
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${key}`,
          },
        }
      );
      const res = response.data.choices[0].message.content;
      const cleanedText = res.trim().replace(/^"|"$/g, "");
      const clearNumber = cleanedText.replace(/\d+\./g, "");
      const lines = clearNumber.split("\n");
      const arrayObj = [];
      for (let i = 0; i <= lines.length - 1; i++) {
        arrayObj.push({
          itemId: i + 1,
          ItemName: lines[i],
          blockedBy: i,
        });
      }
      return arrayObj;
    } catch (error) {
      throw new Error("Error sending chat request:", error);
    }
  }
}

module.exports = { GPT };
