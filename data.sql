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