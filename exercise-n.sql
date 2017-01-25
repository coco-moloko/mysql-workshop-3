Exercise 1:

CREATE TABLE Account(id INT auto_increment primary key, email varchar(255), 
password varchar(40), createdOn datetime, modifiedOn datetime);

CREATE TABLE AddressBook(id int auto_increment primary key, accountId int, 
name varchar(255), createdOn datetime, modifiedOn datetime);

CREATE TABLE Entry(id int auto_increment primary key, addressBookId int, 
firstName varchar(255), lastName varchar(255), birthday datetime, 
type enum('phone','address','electronic-mail'));

CREATE TABLE Address(id int auto_increment primary key, entryId int, 
type enum('home','work','other'), addressLine1 varchar(255), 
addressLine2 varchar(255), city varchar(255), province varchar(128), 
country varchar(128), postalCode varchar(10));

CREATE TABLE ElectronicMail(id int auto_increment primary key, entryId int, 
type enum('home','work','other'), content varchar(255));

CREATE TABLE Phone(id int auto_increment primary key, entryId int, 
type enum('home','work','other'), subtype enum('landline','cellular','fax'), 
content varchar(255));

Exercise 2:

USE decodemtl_addressbook
source data/import-account.sql;
source data/import-addressbook.sql;
source data/import-entry.sql;

Exercise 3:

SELECT country, COUNT(*) as number from Address group by country order by number DESC;

SELECT lower(country), COUNT(*) as number from Address group by country order by number DESC;

Exercise 4:

SELECT name, firstName from AddressBook, Entry WHERE name = "Pharetra Ut Limited" GROUP BY firstName;

Exercise 5:
SELECT COUNT(*) FROM ElectronicMail;

SELECT content
    FROM ElectronicMail,
    JOIN Entry WHERE addressBookId = 100;

Exercise 6:

SELECT content 
    FROM Phone
    JOIN Entry ON Entry.id = Phone.entryId
    WHERE firstName = "Charlotte" AND lastName = "Jenkins";
    
Exercise 7:

SELECT DISTINCT content FROM ElectronicMail;

Exercise 8:

SELECT COUNT(*)subtype 
    FROM Phone
    JOIN Entry ON Entry.id = Phone.entryId
    WHERE birthday between "1950-10-01" AND "1960-10-01";

Exercise 9:

SELECT * 
    FROM Address
    WHERE country IN ("Canada","Austria","Isle of Man","Ireland","Japan")
    GROUP BY city;

Exercise 10:

UPDATE ElectronicMail SET type = "home";
UPDATE ElectronicMail SET type = "work";