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


