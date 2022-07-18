/*Queries that provide answers to the questions from all projects.*/

SELECT *  FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered=true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name ='Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE NOT name='Gabumon';
SELECT * FROM animals WHERE weight_kg >= '10.4' and weight_kg <='17.3';

-- update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
SELECT * FROM animals;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name  LIKE '%mon';
UPDATE animals SET species ='pokemon' WHERE  species IS null;
COMMIT;
SELECT * FROM animals;

-- delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Delete all animals born after Jan 1st, 2022.

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT FIRST_POINT;
UPDATE animals SET weight_kg = weight_kg * (-1);
ROLLBACK TO FIRST_POINT;
UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

-- Write queries to answer the following questions:
SELECT COUNT(*) as total_animals FROM animals;
SELECT COUNT(*) as zero_escape_attempts FROM animals WHERE escape_attempts = '0';
SELECT AVG(weight_kg) as average_animal_weight FROM animals;
SELECT neutered, MAX(escape_attempts) FROM ANIMALS GROUP BY neutered;
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth  BETWEEN '1990-01-01'AND '2000-01-01'  GROUP BY species;;

-- Write queries (using JOIN) to answer the following questions: 

    -- What animals belong to Melody Pond?
    SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id AND owners.full_name = 'Melody Pond';
    -- List of all animals that are pokemon (their type is Pokemon).
    SELECT * FROM animals JOIN species ON animals.species_id = species.id AND species.name = 'pokemon';
    -- List all owners and their animals, remember to include those that don't own any animal.
    SELECT * FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id; 
    -- How many animals are there per species?
    SELECT COUNT(*), species.name FROM animals JOIN species on animals.species_id = species.id GROUP BY species.id; 
    -- List all Digimon owned by Jennifer Orwell.
    SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id AND owners.full_name = 'Jennifer Orwell' AND species.name ='Digimon';
    -- List all animals owned by Dean Winchester that haven't tried to escape.
    SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id and owners.full_name ='Dean Winchester' and animals.escape_attempts = 0;
    Who owns the most animals?
SELECT owners.full_name, COUNT(animals) FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(animals) DESC LIMIT 1;

-- The following queries are taking too much time (1 sec = 1000ms can be considered as too much time for database query). Try them on your machine to confirm it:

    SELECT COUNT(*) FROM visits where animal_id = 4;
    SELECT * FROM visits where vet_id = 2;
    SELECT * FROM owners where email = 'owner_18327@mail.com';

--evaluate the performance

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';