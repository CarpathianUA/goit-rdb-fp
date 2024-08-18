-- 3
select c.entity,
       c.code,
       round(avg(ca.number_rabies), 2) as mean_rabies,
       min(ca.number_rabies)           as min_rabies,
       max(ca.number_rabies)           as max_rabies,
       round(sum(ca.number_rabies), 2) as sum_rabies
from countries c
         join
     cases ca on c.id = ca.country_id
where ca.number_rabies is not null
group by c.entity, c.code
order by mean_rabies desc
limit 10;

-- 4
select c.entity,
       c.code,
       ca.year,
       str_to_date(concat(ca.year, '-01-01'), '%Y-%m-%d')                                 as start_of_year,
       curdate()                                                                          as current_date_attr,
       timestampdiff(year, str_to_date(concat(ca.year, '-01-01'), '%Y-%m-%d'), curdate()) as year_difference
from countries c
         join
     cases ca on c.id = ca.country_id
where ca.number_rabies is not null
limit 10;

-- 5
delimiter //

drop function if exists calculate_year_difference;
create function calculate_year_difference(input_year int)
    returns int
    deterministic
begin
    declare year_diff int;

    set year_diff = timestampdiff(year, makedate(input_year, 1), curdate());

    return year_diff;
end //

delimiter ;

select c.entity,
       c.code,
       ca.`year`,
       calculate_year_difference(ca.`year`) as year_difference
from countries c
         join
     cases ca on c.id = ca.country_id
where ca.number_rabies is not null
limit 10;
