CREATE DATABASE CarDealership;
USE CarDealership;

CREATE TABLE Dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);
CREATE TABLE vehicles (
    VIN INT PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    color VARCHAR(30),
    price DECIMAL(10, 2),
    SOLD BOOLEAN DEFAULT FALSE
);
CREATE TABLE inventory (
    dealership_id INT,
    VIN INT,
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES Dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN INT,
    customer_name VARCHAR(100),
    sale_date DATE,
    sale_price DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO Dealerships (name, address, phone)
VALUES 
('D & B Used Cars', '111 Old Benbrook Rd', '817-555-5555'),
('Luxury Auto Sales', '432 New Orleans Ave', '213-555-1234'),
('City Motors', '1985 Elm St', '972-555-9876'),
('Auto World', '295 Oakwood Blvd', '469-555-2468'),
('Prime Cars', '1547 Market St', '303-555-7890');

INSERT INTO vehicles (VIN, make, model, year, color, price, SOLD)
VALUES 
(10112, 'Ford', 'Explorer', 1993, 'Red', 995.00, FALSE),
(37846, 'Ford', 'Ranger', 2001, 'Yellow', 1995.00, FALSE),
(44901, 'Honda', 'Civic', 2012, 'Gray', 6995.00, FALSE),
(12345, 'Jeep', 'CJ-8', 1981, 'White', 15000.00, TRUE),
(50002, 'Toyota', 'Corolla', 1999, 'Red', 3295.00, FALSE),
(50003, 'Chevrolet', 'Impala', 2010, 'Black', 8995.00, TRUE),
(50004, 'Ford', 'Accord', 2016, 'White', 15995.00, FALSE),
(50005, 'Nissan', 'Altima', 2005, 'Blue', 4595.00, FALSE),
(50006, 'Honda', 'Civic', 2018, 'Gray', 13995.00, FALSE),
(50007, 'Toyota', 'Explorer', 2003, 'Green', 4995.00, TRUE);

INSERT INTO inventory (dealership_id, VIN)
VALUES 
(1, 10112),  -- D & B Used Cars
(1, 37846),  -- D & B Used Cars
(2, 44901),  -- Luxury Auto Sales
(3, 12345),  -- City Motors
(4, 50002),  -- Auto World
(5, 50003),  -- Prime Cars
(2, 50004),  -- Luxury Auto Sales
(3, 50005),  -- City Motors
(1, 50006),  -- D & B Used Cars
(4, 50007);  -- Auto World

INSERT INTO sales_contracts (VIN, customer_name, sale_date, sale_price)
VALUES 
(12345, 'John Doe', '2024-11-21', 12000.00),
(50002, 'Jane Smith', '2024-11-22', 3200.00),
(50003, 'Alex Johnson', '2024-11-20', 8500.00),
(50006, 'Maria Garcia', '2024-11-19', 13000.00),
(50007, 'James White', '2024-11-18', 4700.00);


