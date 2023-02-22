/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM ANIMALS WHERE name LIKE '%mon';
SELECT name from ANIMALS WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
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
SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id ORDER BY owners.full_name;
SELECT species.name AS species, COUNT(*) AS count FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name, species.name AS species FROM animals INNER JOIN species ON animals.species_id = species.id INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jeniffer Orwell' AND species.name = 'Digimon';
SELECT a.name, a.date_of_birth, a.neutered, a.weight_kg, s.name AS species FROM animals AS a INNER JOIN species AS s ON a.species_id = s.id INNER JOIN owners AS o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;
SELECT owners.full_name, COUNT(*) as count FROM animals INNER JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY count DESC LIMIT 1;

