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

insert into owners (id, full_name, age)
values(1, 'Sam Smith', 34),
(2, 'Jennifer Orwell', 19),
(3, 'Bob', 45),
(4, 'Melody Pond', 77),
(5, 'Dean Winchester', 14),
(6, 'Jodie Whittaker', 38);

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
