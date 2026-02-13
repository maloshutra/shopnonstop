const express = require("express");
const cors = require("cors");
const app = express();
const productRoutes = require("./routes/productRoutes");

// Dodaj CORS middleware


app.use(cors({
  origin: [
    'http://localhost:4200',
    'https://shopnonstop.vercel.app'
  ]
}));

app.use(express.json());

app.use("/products", productRoutes);

app.listen(3000, () => {
  console.log("Server radi na portu 3000");
});
