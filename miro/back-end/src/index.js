const express = require("express");
const bodyParser = require("body-parser");
const routes = require("./routes/routes");
const morgan = require("morgan");
const cors = require("cors");

const app = express();
const port = 8000;

app.use(bodyParser.json());
app.use(morgan("dev"));
app.use(cors());

app.use("/", routes);

app.listen(port, () => {
  console.log(`Server listen: ${port}`);
});
