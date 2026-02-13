-- schema.sql
-- Database: prodavnica

-- Kreiranje baze
CREATE DATABASE IF NOT EXISTS prodavnica;
USE prodavnica;

-- Tabela za korisnike
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,      -- jedinstveni ID
    username VARCHAR(50) NOT NULL UNIQUE,   -- username mora biti jedinstven
    email VARCHAR(100) NOT NULL UNIQUE,     -- email korisnika
    password VARCHAR(255) NOT NULL,         -- hashirana lozinka
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela za proizvode
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255),                 -- putanja do slike u storage
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela za korpu
CREATE TABLE IF NOT EXISTS carts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Tabela za stavke u korpi
CREATE TABLE IF NOT EXISTS cart_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Tabela za narudžbe
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',  -- npr. pending, paid, shipped
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Tabela za stavke u narudžbi
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Tabela za logove
CREATE TABLE IF NOT EXISTS logs (
   id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NULL, -- korisnik koji je izvršio akciju, NULL za sistemske radnje
    action_type VARCHAR(50) NOT NULL, -- npr. 'ADD_PRODUCT', 'UPDATE_USER', 'DELETE_ORDER'
    entity VARCHAR(50) NOT NULL,      -- tip entiteta: 'product', 'user', 'order', 'cart'
    entity_id INT NULL,                -- ID entiteta koji je promijenjen
    description TEXT,                  -- detalji akcije
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);
