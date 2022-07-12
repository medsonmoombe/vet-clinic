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
