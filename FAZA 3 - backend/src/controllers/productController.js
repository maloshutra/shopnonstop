const db = require("../config/db");

// GET svi proizvodi
exports.getProducts = (req, res) => {
  const sql = "SELECT * FROM products";

  db.query(sql, (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Greška pri čitanju baze" });
    }

    res.json(results);
  });
};

// POST novi proizvod
exports.createProduct = (req, res) => {
  const { name, description, price } = req.body;

  const sql = "INSERT INTO products (name, description, price) VALUES (?, ?, ?)";

  db.query(sql, [name, description, price], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Greška pri unosu u bazu" });
    }

    res.status(201).json({
      message: "Proizvod dodat",
      productId: result.insertId
    });
  });
};
