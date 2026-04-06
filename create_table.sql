create database SIS04T25;
use SIS04T25;

create table if not exists Customers(
CustomerID int primary key auto_increment,
CustomerName varchar (100), 
ContactName varchar(100),
Address varchar(100), 
City varchar(100),
PostalCode int,
Country varchar(100)
);
create table if not exists Categories(
CategoryID int primary key auto_increment,
CategoryName varchar(100),
Description TEXT
);
create table if not exists Employees(
EmployeeID int primary key auto_increment,
LastName varchar(100),
FirstName varchar(100),
BirthDate date,
Photo blob,
Notes text
);
create table if not exists Shippers(
ShipperID int primary key auto_increment,
ShipperName varchar(150),
Phone varchar(20)
); 
create table if not exists Suppliers(
SupplierID int primary key auto_increment,
SupplierName varchar (150),
ContactName varchar(150),
Address varchar(150), 
City varchar(150),
PostalCode int,
Country varchar(150),
Phone varchar(20)
);
create table if not exists Products(
ProductID int primary key auto_increment,
ProductName varchar(150),
Unit varchar(50),
Price decimal(10,2),
SupplierID INT,
CategoryID INT,
foreign key (SupplierID) references Suppliers(supplierID), 
foreign key (CategoryID) references Categories(CategoryID)
);
create table if not exists Orders(
OrderID int primary key auto_increment,
OrderDate date,
CustomerID INT,
EmployeeID INT,
ShipperID INT,
foreign key (CustomerID) references Customers(CustomerID),
foreign key (EmployeeID) references employees(employeeID),
foreign key (ShipperID) references Shippers(shipperID)  
);
create table if not exists OrderDetails(
OrderDetailID int primary key auto_increment,
Quantity int,
OrderID INT,
ProductID INT,
foreign key (OrderID) references Orders(OrderID),
foreign key (ProductID) references Products(ProductID)
);
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country) VALUES
('Mercado Silva', 'João Silva', 'Rua A, 123', 'São Paulo', 12345, 'Brasil'),
('Padaria Pão Doce', 'Maria Souza', 'Rua B, 456', 'Rio de Janeiro', 23456, 'Brasil');

-- Categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Bebidas', 'Produtos líquidos'),
('Alimentos', 'Comidas em geral');

-- Employees
INSERT INTO Employees (LastName, FirstName, BirthDate, Notes) VALUES
('Oliveira', 'Carlos', '1990-05-10', 'Vendedor'),
('Santos', 'Ana', '1985-08-20', 'Gerente');

-- Shippers
INSERT INTO Shippers (ShipperName, Phone) VALUES
('Correios', '123456789'),
('Transportadora Rápida', '987654321');

-- Suppliers
INSERT INTO Suppliers (SupplierName, ContactName, Address, City, PostalCode, Country, Phone) VALUES
('Fornecedor A', 'Pedro Lima', 'Rua C, 789', 'Belo Horizonte', 34567, 'Brasil', '111111111'),
('Fornecedor B', 'Lucas Alves', 'Rua D, 101', 'Curitiba', 45678, 'Brasil', '222222222');

-- Products
INSERT INTO Products (ProductName, Unit, Price, SupplierID, CategoryID) VALUES
('Refrigerante', '1L', 5.50, 1, 1),
('Pão', 'Unidade', 0.50, 2, 2);

-- Orders
INSERT INTO Orders (OrderDate, CustomerID, EmployeeID, ShipperID) VALUES
('2026-04-01', 1, 1, 1),
('2026-04-02', 2, 2, 2);

-- OrderDetails
INSERT INTO OrderDetails (Quantity, OrderID, ProductID) VALUES
(10, 1, 1),
(20, 2, 2);