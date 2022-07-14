/* Populate database with sample data. */

-- INSERT INTO animals (name) VALUES ('Luna');
-- INSERT INTO animals (name) VALUES ('Daisy');
-- INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES ('Agumon', '2020-02-03', 0, true, 10.23),
       ('Gabumon', '2018-11-15', 2, true, 8),
       ('Pikachu', '2021-01-07', 1, false, 15.04),
       ('Devimon', '2017-05-12', 5, true, 11),
       ('Charmander', '2020-02-8', 0, false, -11),
       ('Plantmon', '2021-11-15', 2, true, -5.7),
       ('Squirtle', '1993-04-02', 3, false, -12.13),
       (' Angemon', '2005-06-12', 1, true, -45),
       ('Boarmon', '2005-06-07', 7, true, 20.4),
       ('Blossom.', '1998-10-13', 3, true, 17),
       ('Ditto', '2022-04-14', 4, true, 22);

-- Inserting data into the owners table:
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       (' Bob', 45)
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

-- Inserting data into the species table: 
INSERT INTO species (name)
VALUES ('Pokemon'),('Digimon');

-- Modify your inserted animals so it includes the species_id value: 
-- If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = (
    SELECT id FROM species WHERE name= 'Digimon')
    WHERE name LIKE '%mon';
    SELECT * FROM animals;


UPDATE animals SET species_id = (
SELECT id FROM species WHERE name ='Pokemon') 
WHERE name NOT LIKE '%mon';
SELECT * FROM animals;

-- Modify your inserted animals to include owner information (owner_id): 

    -- Sam Smith owns Agumon.
    UPDATE animals SET owner_id =( SELECT id FROM owners WHERE full_name ='Sam Smith') WHERE name = ' Agumon';

    -- Jennifer Orwell owns Gabumon and Pikachu.
    UPDATE animals SET owner_id =( SELECT id FROM owners WHERE full_name ='Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';

    -- Bob owns Devimon and Plantmon.
     UPDATE animals SET owner_id =( SELECT id FROM owners WHERE full_name =' Bob') WHERE name = 'Devimon' OR name = 'Plantmon';
    -- Melody Pond owns Charmander, Squirtle, and Blossom.
    UPDATE animals SET owner_id =( SELECT id FROM owners WHERE full_name ='Melody Pond') WHERE name = 'Blossom' OR name = 'Squirtle' OR name = 'Charmander';
    -- Dean Winchester owns Angemon and Boarmon.
         UPDATE animals SET owner_id =( SELECT id FROM owners WHERE full_name ='Dean Winchester') WHERE name = ' Angemon' AND name = 'Boarmon';
-- UPDATE animals SET owner_id = 5 WHERE name = ' Angemon';

-- Insert the following data for vet
INSERT INTO vets (name, age, date_of_graduation)
VALUES('William Tatcher', 45, '2000-04-23'),
      ('Maisy Smith', 26, '2019-01-17'),
      ('Stephanie Mendez', 64, '1981-05-04'),
      ('Jack Harkness', 38, '2008-06-08');

    --Insert the following data for specialties:

    Vet William Tatcher is specialized in Pokemon.
Vet Stephanie Mendez is specialized in Digimon and Pokemon.
Vet Jack Harkness is specialized in Digimon

INSERT INTO specializations (vets_id, species_id)
VALUES (1, 1),
       (3, 2),git 
       (3, 1),
       (4, 2);