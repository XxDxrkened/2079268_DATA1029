DROP DATABASE IF EXISTS library_devoir_semaine_5;

CREATE DATABASE library_devoir_semaine_5;

USE library_devoir_semaine_5;

DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
au_id tinyint NOT NULL AUTO_INCREMENT PRIMARY KEY,
au_lname varchar(50) NOT NULL,
au_fname varchar(50) NOT NULL,
phone varchar(15) NOT NULL UNIQUE CHECK (phone RLIKE '^+[0-9]{10,15}$'),
address varchar(50) NOT NULL,
city varchar(50) NOT NULL,
state varchar(50) NULL,
country varchar(50) NOT NULL,
zip char(6) NOT NULL CHECK (zip RLIKE '^[A-Z][0-9][A-Z][0-9][A-Z][0-9]$'),
contract text NOT NULL,
email varchar(50) NOT NULL CHECK (email RLIKE '%@%') 
);

DROP TABLE IF EXISTS publishers;
CREATE TABLE publishers (
pub_id tinyint NOT NULL AUTO_INCREMENT PRIMARY KEY,
pub_name varchar(50) NOT NULL,
city varchar(50) NOT NULL,
state varchar(50) NULL,
country varchar(50) NOT NULL,
email varchar(50) NOT NULL CHECK (email RLIKE '%@%')
);

DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
title_id tinyint NOT NULL AUTO_INCREMENT PRIMARY KEY,
type ENUM("Roman", "Politique", "Science", "Histoire") NOT NULL,
pub_id smallint NOT NULL REFERENCES publishers(pub_id),
price float NOT NULL,
advance float NOT NULL,
notes varchar(255) NULL,
pub_date date NOT NULL
);

DROP TABLE IF EXISTS redactions;
CREATE TABLE redactions (
au_id tinyint NOT NULL REFERENCES authors(au_id),
title_id tinyint NOT NULL REFERENCES titles(title_id),
au_ord tinyint NOT NULL,
royalty float NOT NULL
);

DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs (
job_id tinyint NOT NULL AUTO_INCREMENT PRIMARY KEY,
job_desc varchar(50) NOT NULL,
min_lvl ENUM("Stagiaire", "Junior", "Intermediaire", "Seinior") NOT NULL,
max_lvl ENUM("Stagiaire", "Junior", "Intermediaire", "Seinior") NOT NULL
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
emp_id tinyint NOT NULL AUTO_INCREMENT PRIMARY KEY,
emp_name varchar(50) NOT NULL,
salary smallint NOT NULL,
fname varchar(50) NOT NULL,
lname varchar(50) NOT NULL,
job_id smallint NOT NULL REFERENCES jobs(job_id),
pub_id smallint NOT NULL REFERENCES publishers(pub_id),
pub_date date NOT NULL,
email varchar(50) NOT NULL CHECK (email RLIKE '%@%')
);

DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
stor_id tinyint NOT NULL AUTO_INCREMENT PRIMARY KEY,
stor_name varchar(50) NOT NULL,
stor_address varchar(50) NOT NULL,
city varchar(50) NOT NULL,
state varchar(50) NULL,
country varchar(50) NOT NULL
);

DROP TABLES IF EXISTS sales;
CREATE TABLE sales (
stor_id tinyint NOT NULL REFERENCES stores(stor_id),
ord_num tinyint NOT NULL AUTO_INCREMENT PRIMARY KEY,
title_id smallint NOT NULL REFERENCES titles(title_id),
ord_date datetime NOT NULL,
qty int NOT NULL
);