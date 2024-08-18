-- 2.1 (fill entities)
insert into countries (entity, code)
select distinct Entity, Code
from infectious_cases
where code is not null;

insert into cases (country_id, year, number_yaws, polio_cases, cases_guinea_worm, number_rabies,
                   number_malaria, number_hiv, number_tuberculosis, number_smallpox, number_cholera_cases)
select c.id,
       i.Year,
       i.Number_yaws,
       i.polio_cases,
       i.cases_guinea_worm,
       i.Number_rabies,
       i.Number_malaria,
       i.Number_hiv,
       i.Number_tuberculosis,
       i.Number_smallpox,
       i.Number_cholera_cases
from infectious_cases i
         join countries c on i.Entity = c.entity and i.Code = c.code;
