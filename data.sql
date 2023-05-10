/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');


insert into animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
values (1, 'Agumon', '2020-2-3', 0, true, 10.23),
(2, 'Gabumon', '2018-11-15', 2, true, 8),
(3, 'Pikachu', '2021-1-7', 1, false, 15.04),
(4, 'Devimon', '2017-5-12', 5, true, 11);