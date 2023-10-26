INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8.00),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11.00),
('Charmander', '2020-02-08', 0, false, 11.00),
('Plantmon', '2021-11-15', 2, true, 5.70),
('Squirtle', '1993-04-02', 3, false, 12.13),
('Angemon', '2005-06-12', 1, true, 45.00),
('Boarmon', '2005-06-07', 7, true, 20.40),
('Blossom', '1998-10-13', 3, true, 17.00),
('Ditto', '2022-05-14', 4, true, 22.00);

--Owners
INSERT INTO owners(full_name, age)
VALUES 
	('Sam Smith', 34),
	('Jennifer Orwell', 19),
	('Bob', 45),
	('Melody Pond', 77),
	('Dean Winchester', 14),
	('Jodie Whittaker', 38);

--Species
INSERT INTO species(name)
VALUES 
	('Pokemon'),
	('Digimon');

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals 
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals
SET owners=(SELECT id from owners WHERE full_name='Dean Wincheste') 
WHERE name IN ('Angemon','Boarmon');

UPDATE animals
SET owners=(SELECT id from owners WHERE full_name='Melody Pond')
WHERE name IN ('Charmander','Squirtle','Blossom');

UPDATE animals
SET owners=(SELECT id from owners WHERE full_name='Bob') 
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owners=(SELECT id from owners WHERE full_name='Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

SELECT * FROM animals;