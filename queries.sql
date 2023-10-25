SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals
WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name FROM animals 
WHERE weight_kg > 10.5 AND escape_attempts > 0;

SELECT * FROM animals 
WHERE neutered = true;

SELECT * FROM animals 
WHERE Gabumon NOT IN animals;

SELECT * FROM animals 
WHERE name <> 'Gabumon';

SELECT * FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

--Vet clinic database: query and update animals table

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'pokemon'
SELECT * FROM animals;
COMMIT;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM CUSTOMERS;
SELECT * FROM CUSTOMERS;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2020-01-01';
SAVEPOINT delete_date;
UPDATE animals
SET weight_kg = weight_kg * - 1;
ROLLBACK TO delete_date;
COMMIT;

--AGGREGATE FUNCTIONS
SELECT COUNT(id) 
FROM animals;

SELECT COUNT(id) 
FROM animals 
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) 
FROM animals;

--GROUP BY
SELECT neutered, AVG(escape_attempts) FROM animals
GROUP BY neutered;

SELECT species, 
MAX(weight_kg),
MIN(weight_kg)
FROM animals
GROUP BY species;

SELECT species, 
AVG(escape_attempts)
FROM animals
WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31' 
GROUP BY species;