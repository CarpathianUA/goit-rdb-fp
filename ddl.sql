-- schema creation
create schema if not exists pandemic;
use pandemic;

-- 2.0 (3NF)
create table if not exists countries (
    id int primary key auto_increment,
    entity varchar(255) not null,
    code varchar(10) not null
);

create table if not exists cases (
    id int primary key auto_increment,
    country_id int,
    year int not null,
    number_yaws float,
    polio_cases float,
    cases_guinea_worm float,
    number_rabies float,
    number_malaria float,
    number_hiv float,
    number_tuberculosis float,
    number_smallpox float,
    number_cholera_cases float,
    foreign key (country_id) references countries(id)
);
