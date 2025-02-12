-- Create table for raw_customers.csv
CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Create table for raw_orders.csv
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(50)
);

-- Create table for raw_payments.csv
CREATE TABLE IF NOT EXISTS payments (
    id SERIAL PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    amount DECIMAL(10, 2)
);

-- Import data from CSV files
\copy customers(id, first_name, last_name) FROM '/docker-entrypoint-initdb.d/raw_customers.csv' DELIMITER ',' CSV HEADER;
\copy orders(id, customer_id, order_date, status) FROM '/docker-entrypoint-initdb.d/raw_orders.csv' DELIMITER ',' CSV HEADER;
\copy payments(id, order_id, payment_method, amount) FROM '/docker-entrypoint-initdb.d/raw_payments.csv' DELIMITER ',' CSV HEADER;