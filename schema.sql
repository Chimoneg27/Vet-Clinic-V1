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

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals
ADD COLUMN owners integer REFERENCES owners(id);

ALTER TABLE animals
ADD COLUMN species integer REFERENCES species(id);