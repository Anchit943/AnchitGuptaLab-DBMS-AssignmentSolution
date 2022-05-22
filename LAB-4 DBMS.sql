
USE ELECTRONIC_COMMERCE; 
-- 1)You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the E-commerce 

CREATE TABLE Suppliers (
    SUPP_ID INT PRIMARY KEY ,
    SUPP_NAME VARCHAR(25) NOT NULL,
    SUPP_CITY VARCHAR(15) NOT NULL ,
    SUPP_PHONE varchar(12) NOT NULL
); 

USE ELECTRONIC_COMMERCE  ;
CREATE TABLE Customer ( 
CUS_ID INT PRIMARY KEY , 
CUS_NAME VARCHAR(20) NOT NULL , 
CUS_PHONE VARCHAR(12) NOT NULL , 
CUS_CITY VARCHAR(20) NOT NULL , 
CUS_GENDER character(1) 
) ;   


CREATE TABLE Category (
    CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(20) NOT NULL
);


CREATE TABLE  Product (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
    PRO_DESC VARCHAR(90),
    CAT_ID INT NOT NULL,
	FOREIGN KEY (CAT_ID) REFERENCES Category (CAT_ID) 
        ); 

     USE ELECTRONIC_COMMERCE ;  
CREATE TABLE Supplier_Pricing ( 
PRICING_ID INT PRIMARY KEY, 
PRO_ID INT NOT NULL , 
foreign key (PRO_ID) references Product (PRO_ID) , 
SUPP_ID INT NOT NULL , 
foreign key (SUPP_ID) references Suppliers (SUPP_ID), 
SUPP_PRICE INT DEFAULT 0 
) ; 


CREATE TABLE Orders  (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT NOT NULL,
	FOREIGN KEY (CUS_ID) REFERENCES Customer (CUS_ID),
    PRICING_ID INT NOT NULL,
    FOREIGN KEY (PRICING_ID) REFERENCES Supplier_Pricing (PRICING_ID)
);


CREATE TABLE Rating (
    RAT_ID INT PRIMARY KEY,
    ORD_ID INT NOT NULL,
    FOREIGN KEY (ORD_ID) REFERENCES Orders (ORD_ID), 
	RAT_RATSTARS INT NOT NULL 
);  

-- 2)	Insert the following data in the table created above
INSERT INTO suppliers VALUES (1, "Rajesh Retails", "Delhi", 1234567890);
INSERT INTO suppliers VALUES (2, "Appario Ltd.", "Mumbai", 2589631470);
INSERT INTO suppliers VALUES (3, "Knome products", "Banglore", 9785462315);
INSERT INTO suppliers VALUES (4, "Bansal Retails", "Kochi",8975463285);
INSERT INTO suppliers VALUES (5, "Mittal Ltd.", "Lucknow", 7898456532);

INSERT INTO customer VALUES (1, "AAKASH", '9999999999', "DELHI", "M");
INSERT INTO customer VALUES (2, "AMAN", '9785463215', "NOIDA", "M");
INSERT INTO customer VALUES (3, "NEHA", '9999999999', "MUMBAI", "F");
INSERT INTO customer VALUES (4, "MEGHA",'9994562399', "KOLKATA", "F");
INSERT INTO customer VALUES (5, "PULKIT", '7895999999', "LUCKNOW", "M");

INSERT INTO category VALUES (1, "BOOKS");
INSERT INTO category VALUES (2, "GAMES");
INSERT INTO category VALUES (3, "GROCERIES");
INSERT INTO category VALUES (4, "ELECTRONICS");
INSERT INTO category VALUES (5, "CLOTHES");

INSERT INTO product VALUES (1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
INSERT INTO product VALUES (2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
INSERT INTO product VALUES (3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
INSERT INTO product VALUES (4, "OATS", "Highly Nutritious from Nestle", 3);
INSERT INTO product VALUES (5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);      
INSERT INTO product VALUES (6, "MILK", "1L Toned MIlk", 3);
INSERT INTO product VALUES (7, "Boat Earphones", "1.5Meter long Dolby Atmos", 4);
INSERT INTO product VALUES (8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
INSERT INTO product VALUES (9, "Project IGI", "compatible with windows 7 and above", 2);
INSERT INTO product VALUES (10, "Hoodie", "Black GUCCI for 13 yrs and above", 5);  
INSERT INTO product VALUES (11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1);
INSERT INTO product VALUES (12, "Train Your Brain", "By Shireen Stephen", 1);         

INSERT INTO supplier_pricing VALUES (1, 1, 2, 1500) ; 
INSERT INTO supplier_pricing VALUES (2, 3, 5, 30000) ; 
INSERT INTO supplier_pricing VALUES (3, 5, 1, 3000) ; 
INSERT INTO supplier_pricing VALUES (4, 2, 3, 2500) ; 
INSERT INTO supplier_pricing VALUES (5, 4, 1, 1000) ; 

INSERT INTO orders VALUES (101, 1500, "2021-10-06", 2, 1);
INSERT INTO orders VALUES (102, 1000, "2021-10-12", 3, 5);
INSERT INTO orders VALUES (103, 30000, "2021-09-16", 5, 2);
INSERT INTO orders VALUES (104, 1500, "2021-10-05", 1, 1);
INSERT INTO orders VALUES (105, 3000, "2021-08-16", 4, 3);
INSERT INTO orders VALUES (106, 1450, "2021-08-18", 1, 4);
INSERT INTO orders VALUES (107, 789, "2021-09-01", 3, 5);
INSERT INTO orders VALUES (108, 780, "2021-09-07", 5, 3);
INSERT INTO orders VALUES (109, 3000, "2021-00-10", 5, 3);
INSERT INTO orders VALUES (110, 2500, "2021-09-10", 2, 4);
INSERT INTO orders VALUES (111, 1000, "2021-09-15", 4, 5);
INSERT INTO orders VALUES (112, 789, "2021-09-16", 4, 4);
INSERT INTO orders VALUES (113, 31000, "2021-09-16", 1, 3);
INSERT INTO orders VALUES (114, 1000, "2021-09-16", 3, 5);
INSERT INTO orders VALUES (115, 3000, "2021-09-16", 5, 3);
INSERT INTO orders VALUES (116, 99, "2021-09-17", 2, 4); 

INSERT INTO rating VALUES (1, 101, 4);
INSERT INTO rating VALUES (2, 102, 3);
INSERT INTO rating VALUES (3, 103, 1);
INSERT INTO rating VALUES (4, 104, 2);
INSERT INTO rating VALUES (5, 105, 4);
INSERT INTO rating VALUES (6, 106, 3);
INSERT INTO rating VALUES (7, 107, 4);
INSERT INTO rating VALUES (8, 108, 4);
INSERT INTO rating VALUES (9, 109, 3);
INSERT INTO rating VALUES (10, 110, 5);
INSERT INTO rating VALUES (11, 111, 3);
INSERT INTO rating VALUES (12, 112, 4); 
INSERT INTO rating VALUES (13, 113, 2);
INSERT INTO rating VALUES (14, 114, 1);
INSERT INTO rating VALUES (15, 115, 1);
INSERT INTO rating VALUES (16, 116, 0);
-- 3)	Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000 
USE ELECTRONIC_COMMERCE;
SELECT 
    customer.CUS_GENDER AS 'Gender', COUNT(*) AS 'Count'
FROM
    customer
        INNER JOIN
    orders USING (CUS_ID)
WHERE
    orders.ORD_AMOUNT >= 3000
GROUP BY CUS_GENDER;


-- 4)	Display all the orders along with the product name ordered by a customer having Customer_Id=2 
USE ELECTRONIC_COMMERCE; 
Select Orders.* , PRO_NAME 
FROM Product , Supplier_pricing , Orders 
WHERE Orders.CUS_ID = 2
AND Orders.CUS_ID = Product.PRO_ID
AND Supplier_pricing.PRO_ID = Product.PRO_ID ; 

-- 5)	Display the Supplier details who can supply more than one product 
USE ELECTRONIC_COMMERCE; 
SELECT *
FROM
    suppliers
WHERE
    SUPP_ID IN ( SELECT SUPP_ID FROM Supplier_pricing GROUP BY SUPP_ID HAVING COUNT(SUPP_ID) > 1); 
    
 -- 6)	Find the category of the product whose order amount is minimum 
 USE ELECTRONIC_COMMERCE;
select p.PRO_NAME, min(sp.SUPP_PRICE), sp.SUPP_ID from product as p inner join supplier_pricing as sp on p.PRO_ID=sp.PRO_ID
group by p.PRO_ID;

select PRO_ID, min(SUPP_PRICE) from supplier_pricing group by PRO_ID, SUPP_ID;

select cat.CAT_ID, cat.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE from category as cat
inner join product as p on cat.CAT_ID=p.CAT_ID
inner join supplier_pricing as sp on sp.PRO_ID=p.PRO_ID
group by cat.CAT_NAME having min(sp.SUPP_PRICE); 

USE ELECTRONIC_COMMERCE ; 
-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.
select PRICING_ID from orders where ORD_DATE > '2021-10-05';
select PRO_ID from supplier_pricing where PRICING_ID in (select PRICING_ID from orders where ORD_DATE > '2021-10-05');
select PRO_ID, PRO_NAME from product 
where PRO_ID in (select PRO_ID from supplier_pricing where PRICING_ID in (select PRICING_ID from orders where ORD_DATE > '2021-10-05')); 

USE ELECTRONIC_COMMERCE ; 
-- 8)	Display customer name and gender whose names start or end with character 'A'
SELECT 
    CUS_NAME AS "Customer Name", CUS_GENDER AS "Gender"
FROM
    customer
WHERE
    CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A'; 
    
    -- 9)	Create a stored procedure to display the Rating for a Supplier if any along with the Verdict on that rating if any like 
--      if rating >4 then “Genuine Supplier” 
--      if rating >2 “Average Supplier” 
--      else “Supplier should not be considered” 
USE ELECTRONIC_COMMERCE ;
select orders.PRICING_ID, avg(rating.RAT_RATSTARS) as rating, case 
when avg(rating.RAT_RATSTARS)=5 then 'Excellent Service'
when avg(rating.RAT_RATSTARS)>4 then 'Good Service'
when avg(rating.RAT_RATSTARS)>2 then 'Average Service'
else 'Poor Service' end as Type_of_Service from orders
inner join rating where orders.ORD_ID=rating.ORD_ID group by orders.PRICING_ID;
    