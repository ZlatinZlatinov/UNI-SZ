CREATE DATABASE REAL_ESTATES COLLATE Cyrillic_General_100_BIN;
GO
USE REAL_ESTATES;
CREATE TABLE clients
(
client_id INT NOT NULL IDENTITY(500,1),
client_pname VARCHAR(50) NOT NULL,
client_lname VARCHAR(50) NOT NULL,
client_address VARCHAR(50) NOT NULL,
client_contact VARCHAR(20) NOT NULL,
client_email VARCHAR(30) NOT NULL,
username VARCHAR(30) NOT NULL,
password VARCHAR(30) NOT NULL,
CONSTRAINT pk_clients PRIMARY KEY(client_id)
);

CREATE TABLE agents
(
agent_id INT NOT NULL IDENTITY(10,1),
agent_pname VARCHAR(50) NOT NULL,
agent_lname VARCHAR(50) NOT NULL,
agent_address VARCHAR(100) NOT NULL,
agent_contact VARCHAR(20) NOT NULL,
agent_email VARCHAR(30) NOT NULL,
agent_type BIT NOT NULL DEFAULT 0,
username VARCHAR(30) NOT NULL,
password VARCHAR(30) NOT NULL,
CONSTRAINT pk_agents PRIMARY KEY(agent_id)
);

CREATE TABLE property_types
(
property_type_id INT NOT NULL,
property_type_name VARCHAR(50) NOT NULL,
CONSTRAINT pk_property_types PRIMARY KEY(property_type_id)
);

CREATE TABLE locations
(
city_ VARCHAR(80) NOT NULL,
description VARCHAR(240) NULL,
url VARCHAR(40) NULL,
sea_nearby BIT NULL DEFAULT 0,
mountain_nearby BIT NULL DEFAULT 0,
CONSTRAINT pk_locations PRIMARY KEY(city)
);

CREATE TABLE properties
(
property_id INT NOT NULL IDENTITY(700,1),
property_type_id INT NOT NULL,
agent_id INT NOT NULL,
city_ VARCHAR(80) NOT NULL,
property_name VARCHAR(80) NOT NULL,
description VARCHAR(250) NULL,
property_livint_area SMALLINT NOT NULL,
property_floor TINYINT NOT NULL,
property_year_built SMALLINT NOT NULL,
property_garage BIT NULL,
property_price DECIMAL(10,2) NOT NULL,
property_status TINYINT NULL DEFAULT 1,
CONSTRAINT pk_properties PRIMARY KEY(property_id),
CONSTRAINT pk_properties_1 FOREIGN KEY(property_type_id) REFERENCES property_types(property_type_id),
CONSTRAINT pk_properties_2 FOREIGN KEY(agent_id) REFERENCES agents(agent_id),
CONSTRAINT pk_properties_3 FOREIGN KEY(city) REFERENCES locations(city)
);

CREATE TABLE images
(
image_id INT NOT NULL IDENTITY(100,1),
property_id INT NOT NULL,
image_name VARCHAR(80) NOT NULL,
image_path VARCHAR(150) NOT NULL,
CONSTRAINT pk_images PRIMARY KEY(image_id),
CONSTRAINT fk_images FOREIGN KEY(property_id) REFERENCES properties(property_id)
);

CREATE TABLE appointments
(
appointment_id INT NOT NULL IDENTITY (100,1),
client_id INT NOT NULL,
agent_id INT NOT NULL,
appointment_date DATETIME NOT NULL,
appointment_description VARCHAR(150) NOT NULL,
appointmentstatus BIT NULL,
CONSTRAINT pk_appointments PRIMARY KEY(appointment_id),
CONSTRAINT fk_appointments_1 FOREIGN KEY(client_id) REFERENCES clients(client_id),
CONSTRAINT fk_appointments_2 FOREIGN KEY(agent_id) REFERENCES agents(agent_id)
);




