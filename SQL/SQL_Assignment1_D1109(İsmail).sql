
CREATE DATABASE Manufacturer

USE Manufacturer

CREATE TABLE Product(
	prod_id INT PRIMARY KEY,
	prod_name VARCHAR (50),
	quantity INT
);
CREATE TABLE Prod_Comp(
	prod_id INT,
	comp_id INT,
	quantity_comp INT,
	PRIMARY KEY (prod_id,comp_id)
);
CREATE TABLE Component(
	comp_id INT PRIMARY KEY,
	comp_name VARCHAR (50),
	[description] VARCHAR (50),
	quantity_comp INT
);
CREATE TABLE Comp_Supp(
	supp_id INT,
	comp_id INT,
	order_date DATE,
	quantity INT,
	PRIMARY KEY (supp_id,comp_id)
);
CREATE TABLE Supplier(
	supp_id INT PRIMARY KEY,
	supp_name VARCHAR (50),
	supp_location VARCHAR (50),
	supp_country VARCHAR (50),
	is_active	BIT
	
);
ALTER TABLE Comp_Supp
	ADD CONSTRAINT FK_supp_id FOREIGN KEY(supp_id) 
    REFERENCES Supplier(supp_id);

ALTER TABLE Comp_Supp
	ADD CONSTRAINT FK_comp_id2 FOREIGN KEY(comp_id) 
    REFERENCES Component(comp_id);


ALTER TABLE Prod_Comp
	ADD CONSTRAINT FK_prod_id2 FOREIGN KEY(prod_id) 
    REFERENCES Product(prod_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE;

ALTER TABLE Prod_Comp
	ADD CONSTRAINT FK_comp_id FOREIGN KEY(comp_id) 
    REFERENCES Component(comp_id);
