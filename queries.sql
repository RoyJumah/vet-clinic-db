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
SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id ORDER BY owners.full_name;
SELECT species.name AS species, COUNT(*) AS count FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name, species.name AS species FROM animals INNER JOIN species ON animals.species_id = species.id INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jeniffer Orwell' AND species.name = 'Digimon';
SELECT a.name, a.date_of_birth, a.neutered, a.weight_kg, s.name AS species FROM animals AS a INNER JOIN species AS s ON a.species_id = s.id INNER JOIN owners AS o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;
SELECT owners.full_name, COUNT(*) as count FROM animals INNER JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY count DESC LIMIT 1;

SELECT a.name
FROM animals a
JOIN visits v ON v.animals_id = a.id
JOIN specializations s ON s.species_id = a.species_id AND s.vet_id = v.vet_id
JOIN vets v2 ON v2.id = v.vet_id AND v2.name = 'William Tatcher'
WHERE v2.id = s.vet_id
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT v.animals_id)
FROM visits v
JOIN vets v2 ON v2.id = v.vet_id AND v2.name = 'Stephanie Mendez';

SELECT v.name, s.name AS specialty
FROM vets v
LEFT JOIN specializations vs ON v.id = vs.vet_id
LEFT JOIN species s ON vs.species_id = s.id
ORDER BY v.id;

SELECT a.name AS animal_name, v.name AS vet_name, vs.name AS species_name, vi.visit_date
FROM animals a
JOIN visits vi ON a.id = vi.animals_id
JOIN vets v ON v.id = vi.vet_id
JOIN specializations s ON s.vet_id = v.id
JOIN species vs ON vs.id = s.species_id
WHERE v.name = 'Stephanie Mendez'
AND vi.visit_date >= '2020-04-01'
AND vi.visit_date <= '2020-08-30';

SELECT a.name, COUNT(*) AS num_visits
FROM animals a
JOIN visits v ON a.id = v.animals_id
GROUP BY a.name
ORDER BY num_visits DESC
LIMIT 1;

SELECT a.name AS animal_name, v.name AS vet_name, visit_date 
FROM visits 
JOIN vets v ON visits.vet_id = v.id 
JOIN animals a ON visits.animals_id = a.id 
WHERE v.name = 'Maisy Smith' 
ORDER BY visit_date 
LIMIT 1;

SELECT a.name AS animal_name, v.name AS vet_name, visit_date
FROM visits
JOIN animals a ON visits.animals_id = a.id
JOIN vets v ON visits.vet_id = v.id
WHERE visit_date = (SELECT MAX(visit_date) FROM visits)
LIMIT 1;

SELECT COUNT(*) 
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animals_id = a.id
LEFT JOIN specializations s ON vt.id = s.vet_id AND a.species_id = s.species_id
WHERE s.id IS NULL;

SELECT s.id, species.name, COUNT(*) AS num_visits
FROM specializations s
JOIN animals a ON s.species_id = a.species_id
JOIN visits v ON a.id = v.animals_id
JOIN vets t ON v.vet_id = t.id
JOIN species ON species.id = a.species_id
WHERE t.name = 'Maisy Smith'
GROUP BY s.id, species.name
ORDER BY num_visits DESC
LIMIT 1;
