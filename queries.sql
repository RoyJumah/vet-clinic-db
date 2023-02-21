/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM ANIMALS WHERE name LIKE '%mon';
SELECT name from ANIMALS WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name from ANIMALS WHERE neutered = True AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM ANIMALS WHERE weight_kg > 10.5
SELECT * FROM ANIMALS WHERE neutered = True;
SELECT * FROM ANIMALS WHERE name != 'Gabumon';
SELECT * FROM ANIMALS WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
delete from animals where date_of_birth > '2022-01-01';
update animals set weight_kg = weight_kg * -1;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
select count(name) from animals;
select count(name) from animals where escape_attempts < 1;
select avg(weight_kg) from animals;
SELECT neutered, AVG(escape_attempts) AS avg_escape_attempts FROM animals GROUP BY neutered ORDER BY AVG(escape_attempts) DESC LIMIT 1;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS avg_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
