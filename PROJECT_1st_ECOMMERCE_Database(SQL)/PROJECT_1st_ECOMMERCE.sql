-- TASK_01 & TASK_02
-- ECOMMERCES STORE PROJECT_01 :   
CREATE DATABASE ecommerce;

USE ecommerce;


CREATE TABLE ADMIN(
Admin_id INT,
NAME VARCHAR(255) NOT NULL,
PASSWORD VARCHAR(255) UNIQUE NOT NULL,
mobile_no VARCHAR(17) NOT NULL,
city VARCHAR(255) NOT NULL
);

DESCRIBE ADMIN;

INSERT INTO ADMIN VALUES(101,'Bhushan Borde','2k22','93932892892','Pune'),
(102,'Roshani Kumbhar','2R22','657589738932','Banglore');

SELECT* FROM ADMIN;

CREATE TABLE customer(
cust_id VARCHAR(10) PRIMARY KEY ,
cust_name CHAR(50) NOT NULL,
cust_password VARCHAR(255)NOT NULL,
cust_gender CHAR(5)NOT NULL,
cust_dob DATETIME NOT NULL,
cust_email CHAR(50)NOT NULL,
cust_city CHAR(50)NOT NULL,
cust_Delivery_address VARCHAR(255)NOT NULL,
cust_contact INT(12) NOT NULL,
current_order VARCHAR(255) NOT NULL,
prev_orders VARCHAR(255) NOT NULL,
cart_ID INT DEFAULT NULL,
paymentinfosaved CHAR(30),
 coupon_id INT REFERENCES Coupon(coupon_id),
FOREIGN KEY (cart_ID) REFERENCES cart(cart_ID)
);
 

DESCRIBE customer;
INSERT INTO customer VALUES
('0023pkr', 'Aishwarya','WFRGFGB','F','2003-11-14 15:23:33', 'aish12@gmail.com','mumbai', 'dadar', 888859944, 'Dress', 'lehanga',105,'yes',12366),
('B12kr', 'Abhi', 'DSDFFEF', 'M', '1995-11-02 15:19:36','abhi34@gmail.com', 'Bangalore', 'bangalore', 988849445, 'Headphone', 'Shirts',101,'yes',345678),
('G_235', 'Ganesh','FGFFGSS','M','2022-11-05 08:11:53', 'ganesh123@gmail.com','Pune', 'Hadapsar Pune', 456777653, 'T_Shirt', 'Cap',103,'yes',984598),
('Tj402', 'Vankatesh','FGHGFSF', 'M', '2002-11-21 15:19:36','vanki@980@gmail.com',  'Chennai', 'chennai', 78906483, 'Homethreater', 'sounds',104,'yes',456678),
('V_Patil', 'Vaibhav','VDFFHH', 'M','2000-11-12 12:41:53','vaibhav123@gmail.com',   'Nanded', 'Latur', 845905668, 'Macbook', 'HP Laptop',101,'yes',5478009);
			
			  
SELECT * FROM customer;

CREATE TABLE Cart(
cart_ID INT PRIMARY KEY ,
Item_Quantity INT(11),
Total_Cost INT(11) 
);

INSERT INTO Cart VALUES
(101, 20, 3000),
(102, 10, 1200),
(103, 2, 200),
(104, 5, 2000),
(105, 10, 70000);

SELECT* FROM cart;

CREATE TABLE cart_item(
cart_ID INT ,
product_id VARCHAR(100),
dateAdded DATE,
purchase VARCHAR(255),
Item_quantity INT(11),
FOREIGN KEY (cart_ID) REFERENCES cart(cart_ID), 
 FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO cart_item VALUES
(101, 'Hag3943r', '2022-11-07', 'NO', 7),
(102, 'P_1', '2022-11-22', 'Yes', 3),
(103, 'P_1', '2022-10-19', 'Yes', 5),
(104, 'P_3', '2022-11-03', 'Yes', 6),
(105, 'P_1', '2022-11-01', 'NO', 3);

DESCRIBE cart_item;

SELECT * FROM cart_item;

CREATE TABLE Category(
category_Id VARCHAR(100),
categoryName VARCHAR(255),
product_id VARCHAR(100),
category VARCHAR(100),
FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO Category VALUES
('cat_285', 'Accessories', 'P_1', 'Headphones'),
('cat_288', 'Laptops', 'P_1', 'Apple'),
('cat_291', 'Accessories', 'P_3', 'Phones'),
('cat_299', 'Phones', 'P_3', 'Vivo'),
('cat_301', 'Fashion', 'P_3', 'Mens');

DESCRIBE Category;
SELECT* FROM Category;


CREATE TABLE seller(
seller_id VARCHAR(100) PRIMARY KEY,
seller_name CHAR(50),
mobile_no INT,
seller_password VARCHAR(50),
categories_of_products_provided VARCHAR(255)
);
DESCRIBE seller;

INSERT INTO seller VALUES
('er455k', 'Jully', 59545554, 'li9345n', 'Accessories'),
('kjhkj54', 'Danni', 345665656, 'ggj54t02', 'Laptop'),
('S-66jd', 'Javed', 483595847, 'ghd3435j', 'fashion'),
('S111_MH', 'Abhi', 8549505, 'V4590nd', 'Accessories'),
('S123_KR', 'Vinay', 84564865, '90hf3e', 'Phones');

SELECT * FROM seller;


CREATE TABLE product(
product_id VARCHAR(100) PRIMARY KEY,
NAME VARCHAR(255),
Color VARCHAR(255),
seller_id VARCHAR(100),
Sizes INT,
Quantity INT,
Cost INT,
Discount DECIMAL(10,2),
Place_for_delevery VARCHAR(255),
Calculation_of_cost INT(10),
isFeatured VARCHAR(255),
Rating INT,
reviewCountry INT,
isOnSale VARCHAR(255),
category_Id VARCHAR(255),
brand VARCHAR(100),
description_ VARCHAR(255),
tags VARCHAR(100),
related_Product VARCHAR(255),
categoryName VARCHAR(255),
seller_name  CHAR(50),
questions  VARCHAR(255),
image TEXT,
 FOREIGN KEY (seller_id) REFERENCES seller(seller_id)
);

INSERT INTO product VALUES
('Hag3943r', 'Rebion Goggals','red-black', 'S123_KR', 34, 1, 2000, 300, 'Latur',1700,
 'yes', 5, 4, 'yes', 'cat_291', 'Rebion', 'sunlight glasses', 'goggles', 'yellow glasses','Fashion','Javed','questions ','image' ),
 ('krt455', 'T_Shirt', 'Yellow', 'S111_MH', 42, 2, 3000, 200, 'Nanded', 1800,'yes', 4, 8, 'yes', 'Fashion',
  'being human', 'T_shirt with cap', 'Trouser', 'being humans jeans','Fashion','Javed','questions ','image '),
  ('P_1', 'Macbook', 'black', 'S123_KR', 14, 1, 120000, 7000, 'pune', 113000,'yes', 5, 40, 'yes', 'C_301', 
  'Apple', 'Product is very branded and good', 'Laptop', 'IPad','Laptops','Danni','questions ','image '),
  ('P_3', 'Vivo_30', 'silver', 'S111_MH', 20, 2, 40000, 2000, 'Latur', 38000,'Welll feat', 7, 20, 'well developed', 'Phones',
   'Vivo', 'Very good phone camera 64 ram 8 gb', 'vivo', 'vivo-28','Phones','Vinay','questions ','image '),
   ('P_490g', 'headphone', 'white', 'S111_MH', 0, 3, 700, 110, 'pune', 590,'yes', 5, 5, 'yes', 'cat_285',
    'realme', 'white headphones', 'realme', 'realme ipods','Accessories','Jully','questions ','image ');
 
  
DESCRIBE product;

SELECT* FROM product;

CREATE TABLE orders(
order_id VARCHAR(255) PRIMARY KEY,
status_ VARCHAR(100),
order_date DATE,
Dilevery_Date DATE,
cust_id VARCHAR(100),
FOREIGN KEY (cust_id) REFERENCES customer(cust_id) 
);

INSERT INTO orders VALUES
('02341mrk', 'shipping', '2022-11-05', '2022-11-08', 'V_Patil'),
('09hjwe3', 'delivered', '2022-11-01', '2022-11-05', '0023pkr'),
('1567o3d', 'delivered', '2022-11-02', '2022-11-04', 'G_235'),
('klr892', 'dileverd soon', '2022-11-04', '2022-11-06', 'B12kr'),
('ormh26', 'shiiping', '2022-11-02', '2022-11-07', 'Tj402');

DESCRIBE orders;

SELECT* FROM orders;

CREATE TABLE payment(
payment_id VARCHAR (100)PRIMARY KEY,
payment_amount INT,
payment_date DATE,
payment_type CHAR(50),
payment_status CHAR(60),
cust_id VARCHAR(100)
);
DESCRIBE payment;

INSERT INTO payment VALUES(1 , 20000 , '2019/08/11', 'UPI' , 'successful' , '0023pkr'),
			  (2 , 40000 , '2019/04/15', 'credit card' , 'successful' , 'B12kr'),
			  (3 , 1000 , '2020/06/04', 'GPAY' , 'successful' , 'G_235'),
			  (4 , 900 , '2021/06/25', 'Debit card' , 'successful' , 'Tj402'),
			  (5 , 2000 , '2021/08/23', 'Phone pay' , 'successful' , 'V_Patil');

SELECT * FROM payment;

CREATE TABLE Coupon(
coupon_id INT PRIMARY KEY,
percentage_discount INT NOT NULL
);

DESCRIBE Coupon;

INSERT INTO Coupon VALUES(123456,20),(123457,38),(123458,50);

DROP TABLE reviewes;
CREATE TABLE reviewes(
rev_id INT PRIMARY KEY,
product_id VARCHAR(100) NOT NULL,
cust_id VARCHAR(10) NOT NULL REFERENCES Customer(cust_id),
rating INT NOT NULL,
average_rating INT NOT NULL,
total_rating INT NOT NULL,
review_country VARCHAR(255) NOT NULL,
FOREIGN KEY(product_id) REFERENCES Product(product_id)
);
DESCRIBE reviewes;

INSERT INTO reviewes VALUES(2012,'Hag3943r','V_Patil',5,4,20,"India");

SELECT* FROM reviewes;

CREATE TABLE Wishlist(
wish_id INT PRIMARY KEY,
productname VARCHAR(255),
product_price INT NOT NULL,
product_id VARCHAR(100) NOT NULL REFERENCES product(product_id),
cust_id VARCHAR (10) NOT NULL REFERENCES customer(cust_id)
);

DESCRIBE Wishlist;

INSERT INTO wishlist VALUES(7001,"Samsung mobile",30000,'P_10','SFDASADSA2');

SELECT * FROM Wishlist;


CREATE TABLE replacement (
rep_id INT PRIMARY KEY,
order_id VARCHAR(255) NOT NULL,
productname VARCHAR(255) NOT NULL,
order_status VARCHAR(255) NOT NULL,
cust_id VARCHAR(10) NOT NULL REFERENCES customer(cust_id),
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);
INSERT INTO replacement VALUES(2001,'09hjwe3',"ASUS mobile",'returned','0023pkr');

DESCRIBE replacement;

SELECT * FROM replacement;

CREATE TABLE shipmentinvoices(
invoice_id INT PRIMARY KEY,
cust_id VARCHAR (10)  NOT NULL REFERENCES customer1(cust_id),
product_id VARCHAR(100) NOT NULL REFERENCES product(pro_id),
order_id VARCHAR(255)NOT NULL,
productname VARCHAR(255) NOT NULL,
paymentway VARCHAR(255) DEFAULT "CASH",
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

INSERT INTO shipmentinvoices VALUES(6576575,'Tj402','P_10','klr892',"Trouser","Gpay");

DESCRIBE shipmentinvoices;
SELECT* FROM shipmentinvoices;

SHOW TABLES;








-- TASK__03
-- QUESTION 01
SELECT * FROM Customer ORDER BY city;

-- QUESTION 02
SELECT * FROM product;
ALTER TABLE product RENAME COLUMN category_id TO prod_category_id;

ALTER TABLE product RENAME COLUMN categoryName TO prod_category_name;

ALTER TABLE product RENAME COLUMN product_id TO prod_id;

ALTER TABLE product RENAME COLUMN NAME TO prod_name; 

ALTER TABLE product RENAME COLUMN color TO prod_color; 

ALTER TABLE product RENAME COLUMN cost TO prod_cost; 

ALTER TABLE product RENAME COLUMN sizes TO prod_size_available;
 
ALTER TABLE product RENAME COLUMN quantity TO prod_quantity_available; 

ALTER TABLE product RENAME COLUMN seller_name TO prod_seller_name; 

ALTER TABLE product RENAME COLUMN discount TO prod_current_discount; 

ALTER TABLE product RENAME COLUMN Place_for_delevery TO prod_Place_origing_delivery; 

ALTER TABLE product RENAME COLUMN rating TO prod_rating; 

ALTER TABLE product RENAME COLUMN isonsale TO prod_isonsale;

ALTER TABLE product RENAME COLUMN brands TO prod_brands;

ALTER TABLE product RENAME COLUMN image TO prod_images;

ALTER TABLE product RENAME COLUMN questions TO prod_questions;

SELECT * FROM product;

-- QUETION 03

SELECT C.NAME,C.customer_id,COUNT(O.Order_ID)TOTAL_ORDERS FROM customer C INNER JOIN ORDERS O ON
C.customer_id=O.customer_id GROUP BY C.customer_id HAVING COUNT(O.Order_ID)>=1;

-- QUETION 04

SELECT C.NAME,C.customer_id,COUNT(O.Order_ID)TOTAL_ORDERS FROM customer C INNER JOIN ORDERS O ON
C.customer_id=O.customer_id GROUP BY C.CUSTOMER_ID HAVING COUNT(O.ORDER_ID)>1 AND C.name LIKE "A%A";

-- QUESTION 05
SELECT C.NAME,C.customer_id,SUM(order_cost) "Purchesed amount" FROM Orders O LEFT JOIN Customer C 
ON C.customer_id=O.customer_id WHERE O.order_status="Delivered" AND order_cost>10000
AND C.CUSTOMER_ID HAVING COUNT(O.ORDER_ID)>1;

-- QUESTION 06

DELIMITER $$
CREATE PROCEDURE Create_All_Tables_and_puting_insertion()
BEGIN

CREATE TABLE ADMIN(
Admin_id INT,
NAME VARCHAR(255) NOT NULL,
PASSWORD VARCHAR(255) UNIQUE NOT NULL,
mobile_no VARCHAR(17) NOT NULL,
city VARCHAR(255) NOT NULL
);



INSERT INTO ADMIN VALUES(101,'Ajinkya Satkar','20k22','93932892892','Nagpur'),
(102,'Khushi Shrivastava','20s22','657589738932','Banglore');



CREATE TABLE customer(
cust_id VARCHAR(10) PRIMARY KEY ,
cust_name CHAR(50) NOT NULL,
cust_password VARCHAR(255)NOT NULL,
cust_gender CHAR(5)NOT NULL,
cust_dob DATETIME NOT NULL,
cust_email CHAR(50)NOT NULL,
cust_city CHAR(50)NOT NULL,
cust_Delivery_address VARCHAR(255)NOT NULL,
cust_contact INT(12) NOT NULL,
current_order VARCHAR(255) NOT NULL,
prev_orders VARCHAR(255) NOT NULL,
cart_ID INT DEFAULT NULL,
paymentinfosaved CHAR(30),
 coupon_id INT REFERENCES Coupon(coupon_id),
FOREIGN KEY (cart_ID) REFERENCES cart(cart_ID)
);
 

INSERT INTO customer VALUES
('0023pkr', 'Aishwarya','WFRGFGB','F','2003-11-14 15:23:33', 'aish12@gmail.com','mumbai', 'dadar', 888859944, 'Dress', 'lehanga',105,'yes',12366),
('B12kr', 'Abhi', 'DSDFFEF', 'M', '1995-11-02 15:19:36','abhi34@gmail.com', 'Bangalore', 'bangalore', 988849445, 'Headphone', 'Shirts',101,'yes',345678),
('G_235', 'Ganesh','FGFFGSS','M','2022-11-05 08:11:53', 'ganesh123@gmail.com','Pune', 'Hadapsar Pune', 456777653, 'T_Shirt', 'Cap',103,'yes',984598),
('Tj402', 'Vankatesh','FGHGFSF', 'M', '2002-11-21 15:19:36','vanki@980@gmail.com',  'Chennai', 'chennai', 78906483, 'Homethreater', 'sounds',104,'yes',456678),
('V_Patil', 'Vaibhav','VDFFHH', 'M','2000-11-12 12:41:53','vaibhav123@gmail.com',   'Nanded', 'Latur', 845905668, 'Macbook', 'HP Laptop',101,'yes',5478009);
			
			  


CREATE TABLE Cart(
cart_ID INT PRIMARY KEY ,
Item_Quantity INT(11),
Total_Cost INT(11) 
);

INSERT INTO Cart VALUES
(101, 20, 3000),
(102, 10, 1200),
(103, 2, 200),
(104, 5, 2000),
(105, 10, 70000);



CREATE TABLE cart_item(
cart_ID INT ,
product_id VARCHAR(100),
dateAdded DATE,
purchase VARCHAR(255),
Item_quantity INT(11),
FOREIGN KEY (cart_ID) REFERENCES cart(cart_ID), 
 FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO cart_item VALUES
(101, 'Hag3943r', '2022-11-07', 'NO', 7),
(102, 'P_1', '2022-11-22', 'Yes', 3),
(103, 'P_1', '2022-10-19', 'Yes', 5),
(104, 'P_3', '2022-11-03', 'Yes', 6),
(105, 'P_1', '2022-11-01', 'NO', 3);


CREATE TABLE Category(
category_Id VARCHAR(100),
categoryName VARCHAR(255),
product_id VARCHAR(100),
category VARCHAR(100),
FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO Category VALUES
('cat_285', 'Accessories', 'P_1', 'Headphones'),
('cat_288', 'Laptops', 'P_1', 'Apple'),
('cat_291', 'Accessories', 'P_3', 'Phones'),
('cat_299', 'Phones', 'P_3', 'Vivo'),
('cat_301', 'Fashion', 'P_3', 'Mens');




CREATE TABLE seller(
seller_id VARCHAR(100) PRIMARY KEY,
seller_name CHAR(50),
mobile_no INT,
seller_password VARCHAR(50),
categories_of_products_provided VARCHAR(255)
);


INSERT INTO seller VALUES
('er455k', 'Jully', 59545554, 'li9345n', 'Accessories'),
('kjhkj54', 'Danni', 345665656, 'ggj54t02', 'Laptop'),
('S-66jd', 'Javed', 483595847, 'ghd3435j', 'fashion'),
('S111_MH', 'Abhi', 8549505, 'V4590nd', 'Accessories'),
('S123_KR', 'Vinay', 84564865, '90hf3e', 'Phones');


CREATE TABLE product(
product_id VARCHAR(100) PRIMARY KEY,
NAME VARCHAR(255),
Color VARCHAR(255),
seller_id VARCHAR(100),
Sizes INT,
Quantity INT,
Cost INT,
Discount DECIMAL(10,2),
Place_for_delevery VARCHAR(255),
Calculation_of_cost INT(10),
isFeatured VARCHAR(255),
Rating INT,
reviewCountry INT,
isOnSale VARCHAR(255),
category_Id VARCHAR(255),
brand VARCHAR(100),
description_ VARCHAR(255),
tags VARCHAR(100),
related_Product VARCHAR(255),
categoryName VARCHAR(255),
seller_name  CHAR(50),
questions  VARCHAR(255),
image TEXT,
 FOREIGN KEY (seller_id) REFERENCES seller(seller_id)
);

INSERT INTO product VALUES
('Hag3943r', 'Rebion Goggals','red-black', 'S123_KR', 34, 1, 2000, 300, 'Latur',1700,
 'yes', 5, 4, 'yes', 'cat_291', 'Rebion', 'sunlight glasses', 'goggles', 'yellow glasses','Fashion','Javed','questions ','image' ),
 ('krt455', 'T_Shirt', 'Yellow', 'S111_MH', 42, 2, 3000, 200, 'Nanded', 1800,'yes', 4, 8, 'yes', 'Fashion',
  'being human', 'T_shirt with cap', 'Trouser', 'being humans jeans','Fashion','Javed','questions ','image '),
  ('P_1', 'Macbook', 'black', 'S123_KR', 14, 1, 120000, 7000, 'pune', 113000,'yes', 5, 40, 'yes', 'C_301', 
  'Apple', 'Product is very branded and good', 'Laptop', 'IPad','Laptops','Danni','questions ','image '),
  ('P_3', 'Vivo_30', 'silver', 'S111_MH', 20, 2, 40000, 2000, 'Latur', 38000,'Welll feat', 7, 20, 'well developed', 'Phones',
   'Vivo', 'Very good phone camera 64 ram 8 gb', 'vivo', 'vivo-28','Phones','Vinay','questions ','image '),
   ('P_490g', 'headphone', 'white', 'S111_MH', 0, 3, 700, 110, 'pune', 590,'yes', 5, 5, 'yes', 'cat_285',
    'realme', 'white headphones', 'realme', 'realme ipods','Accessories','Jully','questions ','image ');
 
 

CREATE TABLE orders(
order_id VARCHAR(255) PRIMARY KEY,
status_ VARCHAR(100),
order_date DATE,
Dilevery_Date DATE,
cust_id VARCHAR(100),
FOREIGN KEY (cust_id) REFERENCES customer(cust_id) 
);

INSERT INTO orders VALUES
('02341mrk', 'shipping', '2022-11-05', '2022-11-08', 'V_Patil'),
('09hjwe3', 'delivered', '2022-11-01', '2022-11-05', '0023pkr'),
('1567o3d', 'delivered', '2022-11-02', '2022-11-04', 'G_235'),
('klr892', 'dileverd soon', '2022-11-04', '2022-11-06', 'B12kr'),
('ormh26', 'shiiping', '2022-11-02', '2022-11-07', 'Tj402');


CREATE TABLE payment(
payment_id VARCHAR (100)PRIMARY KEY,
payment_amount INT,
payment_date DATE,
payment_type CHAR(50),
payment_status CHAR(60),
cust_id VARCHAR(100)
);


INSERT INTO payment VALUES(1 , 20000 , '2019/08/11', 'UPI' , 'successful' , '0023pkr'),
			  (2 , 40000 , '2019/04/15', 'credit card' , 'successful' , 'B12kr'),
			  (3 , 1000 , '2020/06/04', 'GPAY' , 'successful' , 'G_235'),
			  (4 , 900 , '2021/06/25', 'Debit card' , 'successful' , 'Tj402'),
			  (5 , 2000 , '2021/08/23', 'Phone pay' , 'successful' , 'V_Patil');

SELECT * FROM payment;

CREATE TABLE Coupon(
coupon_id INT PRIMARY KEY,
percentage_discount INT NOT NULL
);

INSERT INTO Coupon VALUES(123456,20),(123457,38),(123458,50);


CREATE TABLE reviewes(
rev_id INT PRIMARY KEY,
product_id VARCHAR(100) NOT NULL,
cust_id VARCHAR(10) NOT NULL REFERENCES Customer(cust_id),
rating INT NOT NULL,
average_rating INT NOT NULL,
total_rating INT NOT NULL,
review_country VARCHAR(255) NOT NULL,
FOREIGN KEY(product_id) REFERENCES Product(product_id)
);


INSERT INTO reviewes VALUES(2012,'Hag3943r','V_Patil',5,4,20,"India");


CREATE TABLE Wishlist(
wish_id INT PRIMARY KEY,
productname VARCHAR(255),
product_price INT NOT NULL,
product_id VARCHAR(100) NOT NULL REFERENCES product(product_id),
cust_id VARCHAR (10) NOT NULL REFERENCES customer(cust_id)
);


INSERT INTO wishlist VALUES(7001,"Samsung mobile",30000,'P_10','SFDASADSA2');

CREATE TABLE replacement (
rep_id INT PRIMARY KEY,
order_id VARCHAR(255) NOT NULL,
productname VARCHAR(255) NOT NULL,
order_status VARCHAR(255) NOT NULL,
cust_id VARCHAR(10) NOT NULL REFERENCES customer(cust_id),
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);
INSERT INTO replacement VALUES(2001,'09hjwe3',"ASUS mobile",'returned','0023pkr');

CREATE TABLE shipmentinvoices(
invoice_id INT PRIMARY KEY,
cust_id VARCHAR (10)  NOT NULL REFERENCES customer1(cust_id),
product_id VARCHAR(100) NOT NULL REFERENCES product(pro_id),
order_id VARCHAR(255)NOT NULL,
productname VARCHAR(255) NOT NULL,
paymentway VARCHAR(255) DEFAULT "CASH",
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

INSERT INTO shipmentinvoices VALUES(6576575,'Tj402','P_10','klr892',"Trouser","Gpay");

ALTER TABLE product RENAME COLUMN category_id TO prod_category_id;

ALTER TABLE product RENAME COLUMN category_name TO prod_categery_name;
ALTER TABLE product RENAME COLUMN category_id TO prod_category_id;

ALTER TABLE product RENAME COLUMN categoryName TO prod_category_name;

ALTER TABLE product RENAME COLUMN product_id TO prod_id;

ALTER TABLE product RENAME COLUMN NAME TO prod_name; 

ALTER TABLE product RENAME COLUMN color TO prod_color; 

ALTER TABLE product RENAME COLUMN cost TO prod_cost; 

ALTER TABLE product RENAME COLUMN sizes TO prod_size_available;
 
ALTER TABLE product RENAME COLUMN quantity TO prod_quantity_available; 

ALTER TABLE product RENAME COLUMN seller_name TO prod_seller_name; 

ALTER TABLE product RENAME COLUMN discount TO prod_current_discount; 

ALTER TABLE product RENAME COLUMN Place_for_delevery TO prod_Place_origing_delivery; 

ALTER TABLE product RENAME COLUMN rating TO prod_rating; 

ALTER TABLE product RENAME COLUMN isonsale TO prod_isonsale;

ALTER TABLE product RENAME COLUMN brands TO prod_brands;

ALTER TABLE product RENAME COLUMN image TO prod_images;

ALTER TABLE product RENAME COLUMN questions TO prod_questions;

END $$
DELIMITER ;