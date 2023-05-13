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

select animals.name from animals
join owners on animals.owner_id = owners.id
where animals.escape_attempts = 0 and owners.full_name = 'Dean Winchester';

select owners.full_name, count(animals.id) as most_animals from animals
join owners on owners.id = animals.owner_id
group by owners.full_name
order by most_animals desc
limit 1;

select vets.name, animals.name, visits.visit_date from visits
join vets on vet_id = vets.id
join animals on animal_id = animals.id
where vets.name = 'William Tatcher'
order by visits.visit_date desc
limit 1;

select count(distinct animals.id) as total from animals
join visits on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
where vets.name = 'Stephanie Mendez';

select vets.name, species.name from vets
left join specializations on specializations.vet_id = vets.id
left join species on specializations.species_id = species.id;

select animals.name, visits.visit_date from animals
join visits on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
where vets.name = 'Stephanie Mendez'
and visits.visit_date between '2020-4-1' and '2020-8-30';

select animals.name, count(animals.name) as visit_count from animals
join visits on visits.animal_id = animals.id
group by animals.name
order by visit_count desc
limit 1;

select animals.name, visits.visit_date from animals
join visits on visits.animal_id = animals.id
join vets on visits.vet_id = vets.id
where vets.name = 'Maisy Smith'
order by visits.visit_date
limit 1;

select animals.name as animal_name,
animals.date_of_birth,
animals.escape_attempts,
animals.neutered,
animals.weight_kg as animal_weight,
owners.full_name as owner,
vets.name as vet_name,
vets.age as vet_age,
vets.date_of_graduation as vet_graduation_date,
visits.visit_date
from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
join owners on owners.id = animals.owner_id
order by visits.visit_date desc
limit 1;

select count(visits.id) from visits
left join vets on visits.vet_id = vets.id
left join specializations on vets.id = specializations.vet_id
where specializations.vet_id is null;

select species.name as species, count(species.id) as total_visits from visits
left join vets on visits.vet_id = vets.id
left join specializations on vets.id = specializations.vet_id
join animals on visits.animal_id = animals.id
join species on animals.species_id = species.id
where vets.name = 'Maisy Smith'
group by species.name
order by total_visits desc
limit 1;
