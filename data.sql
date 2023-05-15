/* Populate database with sample data. */

insert into animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
values (1, 'Agumon', '2020-2-3', 0, true, 10.23),
(2, 'Gabumon', '2018-11-15', 2, true, 8),
(3, 'Pikachu', '2021-1-7', 1, false, 15.04),
(4, 'Devimon', '2017-5-12', 5, true, 11);

insert into animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
values ('Charmander', '2020-2-8', 11, false, 0),
('Plantmon', '2021-11-15', 5.7, true, 2),
('Squirtle', '1993-4-2', 12.13, false, 3),
('Angemon', '2005-6-12', 45, true, 1),
('Boarmon', '2005-6-7', 20.4, true, 7),
('Blossom', '1998-10-13', 17, true, 3),
('Ditto', '2022-5-14', 22, true, 4);

insert into owners (full_name, age)
values('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

select * from owners;

insert into species(id, name)
values (1, 'Pokemon'),
(2, 'Digimon');

select * from species;

update animals 
set species_id = 1
where name not like '%mon';

update animals 
set species_id = 2
where name like '%mon';

update animals
set owner_id = 1
where name = 'Agumon';

update animals
set owner_id = 2
where name in ('Gabumon', 'Pikachu');

update animals
set owner_id = 3
where name in ('Devimon', 'Plantmon');

update animals
set owner_id = 4
where name in ('Charmander', 'Squirtle', 'Blossom');

update animals
set owner_id = 5
where name in ('Angemon', 'Boarmon');

insert into vets(name, age, date_of_graduation)
values ('William Tatcher', 45, '2000-4-23'),
('Maisy Smith', 26, '2019-1-17'),
('Stephanie Mendez', 64, '1981-5-4'),
('Jack Harkness', 38, '2008-6-8');

insert into specializations(vet_id, species_id)
values (1, 1),
(3, 1),
(3, 2),
(4, 2);

insert into visits(animal_id, vet_id, visit_date)
values (1, 1, '2020-5-24'),
(1, 3, '2020-7-22'),
(2, 4, '2021-2-2'),
(7, 2, '2020-1-5'),
(7, 2, '2020-3-8'),
(7, 2, '2020-5-14'),
(3, 3, '2021-5-4'),
(8, 4, '2021-2-24'),
(4, 2, '2019-12-21'),
(4, 1, '2020-8-10'),
(4, 2, '2021-4-7'),
(9, 3, '2019-9-29'),
(5, 4, '2020-10-3'),
(5, 4, '2020-11-4'),
(6, 2, '2019-1-24'),
(6, 2, '2019-5-15'),
(6, 2, '2020-2-27'),
(6, 2, '2020-8-3'),
(10, 3, '2020-5-24'),
(10, 1, '2021-1-11');

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animal_ids.id, vets_ids.id, visit_timestamp
FROM (SELECT id FROM animals) AS animal_ids
CROSS JOIN (SELECT id FROM vets) AS vets_ids
CROSS JOIN generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') AS visit_timestamp;
-- Alter sequence because it had duplicate Ids that result in errors
ALTER SEQUENCE owners_id_seq RESTART WITH 2500001;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

