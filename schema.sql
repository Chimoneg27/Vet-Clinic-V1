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

ALTER TABLE owners 
ADD COLUMN email VARCHAR(120);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals
ADD COLUMN owners integer REFERENCES owners(id);

ALTER TABLE animals
ADD COLUMN species integer REFERENCES species(id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    id serial PRIMARY KEY,
    vet_id integer REFERENCES vets(id),
    species_id integer REFERENCES species(id)
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id integer REFERENCES animals(id),
    vet_id integer REFERENCES vets(id),
    date_of_visit DATE
);
