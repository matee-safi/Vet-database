/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';

select name from animals where date_of_birth between '2016-1-1' and '2019-12-31';

select name from animals  where neutered = true and escape_attempts < 3;

select date_of_birth from animals where name in ('Agumon', 'Pikachu');

select escape_attempts from animals where weight_kg > 10.5;

select * from animals where neutered = true;

select * from animals where name != 'Gabumon';

select * from animals where weight_kg between 10.4 and 17.3;

begin;
update animals
set species = 'unidentified';
select * from animals;
rollback;
select * from animals;

begin;
update animals 
set species = 'degimon'
where name like '%mon';
update animals 
set species = 'pokemon'
where name not like '%mon';
select * from animals;
commit;
select * from animals;

begin;
delete from animals;
select * from animals;
rollback;
select * from animals;

begin;
delete from animals
where date_of_birth > '2022-1-1';
select * from animals;
savepoint sp1;
update animals
set weight_kg = weight_kg * -1;
select * from animals;
rollback to sp1;
select * from animals;
update animals
set weight_kg = weight_kg * -1
where sign(weight_kg) = '-1';
select * from animals;
commit;



select count(id) as total from animals;
select * from animals
where escape_attempts = 0;
select avg(weight_kg) as avg_weight_kg from animals;
select neutered, avg(escape_attempts) as average_escape_attempts from animals group by neutered;
select species, min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals 
where date_of_birth between '1990-1-1' and '2000-12-31'
group by species;


select animals.name from animals
join owners on animals.owner_id = owners.id
where full_name = 'Melody Pond';

select * from animals
join species on animals.species_id = species.id
where species.name = 'Pokemon';

select * from owners
left join animals on owners.id = animals.owner_id;

select species.name, count(animals.id) as total from animals
join species on animals.species_id = species.id
group by species.name;

select animals.name from animals
join owners on animals.owner_id = owners.id
join species on animals.species_id = species.id
where owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon';

select owners.full_name, count(animals.id) as most_animals from animals
join owners on owners.id = animals.owner_id
group by owners.full_name
order by most_animals desc
limit 1;