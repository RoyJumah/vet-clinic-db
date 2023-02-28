/* Populate database with sample data. */

INSERT INTO ANIMALS(name,date_of_birth,weight_kg,neutered,escape_attempts)
VALUES('Agumon','2020-02-03',10.23,True,0);
VALUES('Gabumon','2018-11-03',8.00,True,2);
VALUES('Pikachu','2021-01-07',15.04,False,1);
VALUES('Devimon','2017-05-12',11.00,True,5);
VALUES('Charmander','2020-02-08',11,False,0);
VALUES('Plantmon','2021-11-15',5.7,True,2);
VALUES('Squirtle','1993-04-15',12.13,False,3);
VALUES('Angemon','2005-06-12',45,True,1);
VALUES('Boarmon','2005-06-07',20.4,True,7);
VALUES('Blossom','1998-10-13',17,True,3);
VALUES('Ditto','2022-05-14',22,True,4);

INSERT INTO OWNERS(full_name, age)
VALUES('Sam Smith', 34);
VALUES('Jeniffer Orwell', 19);
VALUES('Melody Pond', 77);
VALUES('Dean Winchester',14);
VALUES('Jodie Whittaker', 38);
VALUES('Bob', 45);

INSERT INTO species(name)
VALUES('Pokemon');
VALUES('Digimon');

UPDATE animals SET species_id = CASE WHEN name LIKE '%mon' THEN 2 ELSE 1 END;
UPDATE animals SET owner_id = CASE
                    WHEN name = 'Agumon' THEN 1 
                    WHEN name IN ('Gabumon', 'Pikachu') THEN 2 
                    WHEN name IN ('Devimon', 'Plantmon') THEN 7
                    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN 3
                    WHEN name IN ('Angemon', 'Boarmon') THEN 4 
                 END;


insert into vets(name,age,date_of_graduation)
values('William Tatcher', 45,'2020-04-23')
values('Maisy Smith',26,'2019-01-17')
values('Stephanie Mendez', 64, '1981-05-04')
values('Jack Harkness',38,'2008-06-08');


insert into specializations(vet_id, species_id)
values(
	(select id from vets where name = 'William Tatcher'), 
	(select id from species where name ='Pokemon')
	);

insert into specializations(vet_id, species_id)
select v.id, s.id
from vets v
join species s on s.name in ('Digimon', 'Pokemon')
where v.name = 'Stephanie Mendez';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-05-24'
from animals a
join vets v on v.name = 'William Tatcher'
where a.name = 'Agumon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-07-22'
from animals a
join vets v on v.name = 'Stephanie Mendez'
where a.name = 'Agumon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2021-02-02'
from animals a
join vets v on v.name = 'Jack Harkness'
where a.name = 'Gabumon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-01-05'
from animals a
join vets v on v.name = 'Maisy Smith'
where a.name = 'Pikachu';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-05-08'
from animals a
join vets v on v.name = 'Maisy Smith'
where a.name = 'Pikachu';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-05-14'
from animals a
join vets v on v.name = 'Maisy Smith'
where a.name = 'Pikachu';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2021-05-14'
from animals a
join vets v on v.name = 'Stephanie Mendez'
where a.name = 'Devimon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2021-02-14'
from animals a
join vets v on v.name = 'Jack Harkness'
where a.name = 'Charmander';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2019-12-21'
from animals a
join vets v on v.name = 'Maisy Smith'
where a.name = 'Plantmon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-08-10'
from animals a
join vets v on v.name = 'William Tatcher'
where a.name = 'Plantmon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2021-04-07'
from animals a
join vets v on v.name = 'Maisy Smith'
where a.name = 'Plantmon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2019-09-29'
from animals a
join vets v on v.name = 'Stephanie Mendez'
where a.name = 'Squirtle';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-10-03'
from animals a
join vets v on v.name = 'Jack Harkness'
where a.name = 'Angemon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-11-04'
from animals a
join vets v on v.name = 'Jack Harkness'
where a.name = 'Angemon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2019-01-24'
from animals a
join vets v on v.name = 'Maisy Smith'
where a.name = 'Boarmon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2019-05-15'
from animals a
join vets v on v.name = 'Maisy Smith'
where a.name = 'Boarmon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-02-27'
from animals a
join vets v on v.name = 'Maisy Smith'
where a.name = 'Boarmon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-08-03'
from animals a
join vets v on v.name = 'Maisy Smith'
where a.name = 'Boarmon';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2021-01-11'
from animals a
join vets v on v.name = 'William Tatcher'
where a.name = 'Blossom';

insert into visits(animals_id, vet_id, visit_date)
select a.id, v.id, '2020-05-24'
from animals a
join vets v on v.name = 'Stephanie Mendez'
where a.name = 'Blossom';

INSERT INTO visits_clustered (animals_id, vet_id, visit_date)
SELECT animals_id, vet_id, visit_date
FROM visits;