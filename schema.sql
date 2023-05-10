/* Database schema to keep the structure of entire database. */

create database vet_clinic;

\c vet_clinic;

CREATE TABLE animals (
    id int,
    name varchar(40),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

insert into animals(name, date_of_birth, weight_kg, neutered, escape_attempts)
values ('Agumon', '2020-2-3', 10.23, true, 0);