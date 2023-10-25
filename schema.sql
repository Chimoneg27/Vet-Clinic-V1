CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255),
	date_of_birth DATE,
    escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL(6, 2)
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(45);