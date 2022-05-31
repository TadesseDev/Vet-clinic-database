/*Queries that provide answers to the questions from all projects.*/
SELECT *
from animals
WHERE name like '%mon';
SELECT name
from animals
WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-1-1';
SELECT name
from animals
WHERE neutered = TRUE
  AND escape_attempts < 3;
SELECT date_of_birth
from animals
WHERE name like 'Agumon'
  or name like 'Pikachu';
SELECT name,
  escape_attempts
from animals
WHERE weight_kg > 10.5;
SELECT *
from animals
WHERE neutered = TRUE;
SELECT *
from animals
WHERE name NOT like 'Gabumon';
SELECT *
from animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;
select 'Agumon' like '%mon';
select *
from animals;
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