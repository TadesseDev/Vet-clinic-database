-- Vet clinic database: query and update animals table
--1 update and rollback species column.
BEGIN TRANSACTION;
UPDATE animals
set species = 'unspecified';
select *
from animals;
ROLLBACK TRANSACTION;
SELECT *
FROM animals;
--2 update and commit species column.
BEGIN TRANSACTION;
UPDATE animals
SET species = 'digimon'
WHERE name like '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT TRANSACTION;
select *
from animals;
--3 Delete and rollback transaction.
BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK TRANSACTION;
SELECT *
FROM animals;
--3 Transaction with a save point.
BEGIN TRANSACTION;
DELETE FROM animals
where date_of_birth = '2021/1/1';
SAVEPOINT delete_january_2021;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_january_2021;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT TRANSACTION;
select *
from animals;
--4 Transaction with a save point.
select COUNT(*)
from animals;
--
select COUNT(*)
from animals
where escape_attempts = 0;
--
select AVG(weight_kg)
from animals;
--
SELECT neutered,
  SUM(escape_attempts) as escaped
FROM animals
GROUP BY neutered;
--
SELECT species,
  min(weight_kg),
  max(weight_kg)
FROM animals
GROUP BY species;
--
SELECT species,
  AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990/1/1' and '2000/1/1'
GROUP BY species;