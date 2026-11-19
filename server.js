const express = require('express');
const cors = require('cors');
const db = require('./db');
const app = express();
app.use(cors());
app.use(express.json());

app.get('/api/products', (req, res) => {
  db.query('SELECT * FROM products', (err, result) => {
    if (err) return res.json(err);
    res.json(result);
  });
});

app.get('/api/products/:id/prices', (req, res) => {
  db.query('SELECT * FROM retailer_prices WHERE product_id = ?', [req.params.id], (err, result) => {
    if (err) return res.json(err);
    res.json(result);
  });
});
// Category Filter
app.get('/api/products/category/:category', (req, res) => {
  db.query('SELECT * FROM products WHERE category = ?', [req.params.category], (err, result) => {
    if (err) return res.json(err);
    res.json(result);
  });
});

// Recommendation
app.post('/api/recommend', (req, res) => {
  const { need, budget, minRating } = req.body;
  db.query(
    'SELECT * FROM products WHERE need = ? AND price <= ? AND rating >= ? ORDER BY rating DESC',
    [need, budget, minRating || 0],
    (err, result) => {
      if (err) return res.json(err);
      res.json(result);
    }
  );
});

app.listen(5000, () => console.log('Backend running on 5000'));