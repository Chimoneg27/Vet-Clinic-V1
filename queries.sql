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

--Join queries
SELECT animals.name
FROM animals
INNER JOIN owners ON animals.owners = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
INNER JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name AS owner, animals.name AS animal_name
FROM owners
LEFT JOIN animals ON owners.id = animals.owners;

SELECT species.name AS species_name, COUNT(animals.id) AS animal_count
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

SELECT a.name
from animals
a JOIN species s ON a.species_id = s.id 
JOIN owners o ON a.owners = o.id
WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';

SELECT a.name 
FROM animals a 
JOIN owners o ON a.owners = o.id 
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name 
AS owner_name, count(a.id) 
FROM owners o 
JOIN animals a ON o.id = a.owners
GROUP BY o.full_name 
ORDER BY count(a.id) DESC;

--queries for Visits

SELECT a.name 
FROM animals a JOIN visits v ON v.animal_id = a.id 
JOIN vets ve ON ve.id = v.vet_id 
WHERE ve.name = 'William Tatcher' 
ORDER BY v.date_of_visit DESC
LIMIT 1;

SELECT COUNT(DISTINCT a.id) AS num_animals_seen
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Stephanie Mendez';

SELECT ve.name, s.name 
from vets ve LEFT JOIN specializations spe ON spe.vet_id = ve.id 
LEFT JOIN species s ON s.id = spe.species_id;

SELECT a.name, COUNT(*) AS num_visits
FROM visits v
JOIN animals a ON v.animal_id = a.id
GROUP BY a.id
ORDER BY num_visits DESC
LIMIT 1;

SELECT count(v.id) from visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets ve ON v.vet_id = ve.id
LEFT JOIN specializations spe ON spe.vet_id = ve.id AND spe.species_id = a.species_id
WHERE spe.id IS NULL;

SELECT s.name FROM animals a
JOIN species s ON a.species_id = s.id
JOIN visits v ON v.animal_id = a.id
JOIN vets ve ON ve.id = v.vet_id
where ve.name = 'Maisy Smith'
GROUP BY s.name
ORDER BY count(a.id) DESC;

SELECT a.name, v.date_of_visit 
FROM animals a 
JOIN visits v ON v.animal_id = a.id 
JOIN vets ve ON ve.id = v.vet_id 
WHERE ve.name = 'Stephanie Mendez' AND v.date_of_visit 
BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name 
FROM animals a 
JOIN visits v ON v.animal_id = a.id 
JOIN vets ve ON ve.id = v.vet_id 
WHERE ve.name = 'Maisy Smith' 
ORDER BY v.date_of_visit ASC
LIMIT 1;