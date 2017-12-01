CREATE TABLE Department(
	id int NOT NULL PRIMARY KEY, 
	icons varchar(255) NOT NULL, 
	link varchar(255) NOT NULL, 
	title varchar(255) NOT NULL UNIQUE, 
	description text NOT NULL, 
	parentId int,
	FOREIGN KEY (parentId) REFERENCES Department(id)
	);

-- add average rating to product
CREATE TABLE Product(
	id int NOT NULL PRIMARY KEY, 
	title varchar(255) NOT NULL UNIQUE, 
	featured bit NOT NULL, 
	description text NOT NULL, 
	stockQuantity int NOT NULL, 
	price_BasePrice decimal(10,2) NOT NULL, 
	price_Discount decimal(10,2) NOT NULL, 
	price_Vat decimal(10,2) NOT NULL,
    deptID int NOT NULL,
    FOREIGN KEY (deptID) REFERENCES Department (id)
	); 

CREATE TABLE Users(
	id int NOT NULL PRIMARY KEY, 
	phoneNumber varchar(16), 
	email varchar(255) NOT NULL, 
	address_city varchar(255) NOT NULL, 
	address_zip int(7) NOT NULL, 
	address_street varchar(255) NOT NULL, 
	fullName_FirstName varchar(255) NOT NULL, 
	fullName_LastName varchar(255) NOT NULL, 
	personNr varchar(12), 
	checkBox bit NOT NULL, 
	password varchar(255) NOT NULL
	);

CREATE TABLE User_Product(
	uid int NOT NULL, 
	pid int NOT NULL,
	review_stars int NOT NULL,
	review_text text NOT NULL,
	Constraint uid_FK FOREIGN KEY (uid) REFERENCES Users (id), 
	Constraint pid_FK FOREIGN KEY (pid) REFERENCES Product (id), 
	Constraint puid_PK PRIMARY KEY (uid, pid)
	);

CREATE TABLE Keywords(
	keyword_id int NOT NULL PRIMARY KEY,
	name varchar NOT NULL UNIQUE
	pid_FK int NOT NULL,
	FOREIGN KEY (pid) REFERENCES Product (id)
	);

CREATE TABLE Order (
	orderID int NOT NULL PRIMARY KEY,
	orderDate varchar(10) NOT NULL,
	lastChangeDate varchar(10) NOT NULL,
	lastChangeDate varchar(10) NOT NULL,
	paymentReference varchar(10) NOT NULL UNIQUE,
	trackingNumber varchar(10) UNIQUE,
	);
);
