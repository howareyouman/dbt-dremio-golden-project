-- Create table for raw_customers.csv
CREATE TABLE IF NOT EXISTS customers (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50)
);

-- Create table for raw_items.csv
CREATE TABLE IF NOT EXISTS items (
    id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50),
    sku VARCHAR(50)
);

-- Create table for raw_orders.csv
CREATE TABLE IF NOT EXISTS orders (
    id VARCHAR(50) PRIMARY KEY,
    customer VARCHAR(50),
    ordered_at TIMESTAMP,
    store_id VARCHAR(50),
    subtotal DECIMAL(10, 2),
    tax_paid DECIMAL(10, 2),
    order_total DECIMAL(10, 2)
);

-- Create table for raw_payments.csv
CREATE TABLE IF NOT EXISTS payments (
    id SERIAL PRIMARY KEY,
    order_id VARCHAR(50),
    payment_method VARCHAR(50),
    amount DECIMAL(10, 2)
);

-- Create table for raw_products.csv
CREATE TABLE IF NOT EXISTS products (
    sku VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(50),
    price DECIMAL(10, 2),
    description VARCHAR(4000)
);

-- Create table for raw_stores.csv
CREATE TABLE IF NOT EXISTS stores (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    opened_at TIMESTAMP,
    tax_rate DECIMAL(10, 2)
);

-- Create table for raw_supplies.csv
CREATE TABLE IF NOT EXISTS supplies (
    id VARCHAR(50),
    name VARCHAR(50),
    cost DECIMAL(10, 2),
    perishable BOOLEAN,
    sku VARCHAR(50)
);

-- Import data from CSV files
\copy customers(id, name) FROM '/docker-entrypoint-initdb.d/raw_customers.csv' DELIMITER ',' CSV HEADER;
\copy items(id, order_id, sku) FROM '/docker-entrypoint-initdb.d/raw_items.csv' DELIMITER ',' CSV HEADER;
\copy orders(id, customer, ordered_at, store_id, subtotal, tax_paid, order_total) FROM '/docker-entrypoint-initdb.d/raw_orders.csv' DELIMITER ',' CSV HEADER;
\copy payments(id, order_id, payment_method, amount) FROM '/docker-entrypoint-initdb.d/raw_payments.csv' DELIMITER ',' CSV HEADER;
\copy products(sku, name, type, price, description) FROM '/docker-entrypoint-initdb.d/raw_products.csv' DELIMITER ',' CSV HEADER;
\copy stores(id, name, opened_at, tax_rate) FROM '/docker-entrypoint-initdb.d/raw_stores.csv' DELIMITER ',' CSV HEADER;
\copy supplies(id, name, cost, perishable, sku) FROM '/docker-entrypoint-initdb.d/raw_supplies.csv' DELIMITER ',' CSV HEADER;