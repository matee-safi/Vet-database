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

alter table animals
add column species varchar(40);

create table owners (
	id serial primary key,
	full_name varchar(50),
	age int
);

create table species (
	id serial primary key,
	name varchar(40)
);

alter table animals drop id;
alter table animals add id serial primary key;
alter table animals drop species;
alter table animals add species_id int references species (id);
alter table animals add owner_id int references owners (id);

create table vets(
	id serial primary key,
	name varchar(50),
	age int,
	date_of_graduation date
);

create table specializations(
	id serial primary key,
	vet_id int references vets (id),
	species_id int references species (id)
);

create table visits(
	id serial primary key,
	animal_id int references animals(id),
	vet_id int references vets (id),
    visit_date date
);