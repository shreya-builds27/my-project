CREATE DATABASE IF NOT EXISTS shopping_db;
USE shopping_db;

CREATE TABLE IF NOT EXISTS retailers (
  retailer_id INT PRIMARY KEY AUTO_INCREMENT,
  retailer_name VARCHAR(100),
  website VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS products (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(200),
  category VARCHAR(100),
  brand VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS product_prices (
  price_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  retailer_id INT,
  retailer_price DECIMAL(10,2),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (retailer_id) REFERENCES retailers(retailer_id)
);

CREATE TABLE IF NOT EXISTS product_ratings (
  rating_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  retailer_id INT,
  rating DECIMAL(3,1),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (retailer_id) REFERENCES retailers(retailer_id)
);

INSERT INTO retailers (retailer_name, website) VALUES
('Amazon', 'amazon.in'),
('Flipkart', 'flipkart.com'),
('Myntra', 'myntra.com');

INSERT INTO products (product_name, category, brand) VALUES
('iPhone 15', 'Mobile', 'Apple'),
('Samsung Galaxy S24', 'Mobile', 'Samsung'),
('Sony WH-1000XM5 Headphones', 'Audio', 'Sony'),
('Dell Inspiron Laptop', 'Laptop', 'Dell'),
('Nike Air Shoes', 'Footwear', 'Nike'),
('LG Washing Machine', 'Appliance', 'LG'),
('Boat Airdopes', 'Audio', 'Boat'),
('HP Printer', 'Electronics', 'HP'),
('Adidas T-Shirt', 'Clothing', 'Adidas'),
('Canon Camera', 'Camera', 'Canon'),
('Apple Watch', 'Wearable', 'Apple');

INSERT INTO product_prices (product_id, retailer_id, retailer_price) VALUES
(1, 1, 71999.00),
(1, 2, 69999.00),
(1, 3, 72999.00),
(3, 1, 29990.00),
(3, 2, 28490.00),
(3, 3, 31000.00),
(5, 2, 4999.00);

INSERT INTO product_ratings (product_id, retailer_id, rating) VALUES
(1, 1, 4.5),
(1, 2, 4.6),
(1, 3, 4.4),
(3, 1, 4.8),
(3, 2, 4.7);