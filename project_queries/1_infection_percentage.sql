-- Let's find the infection percentage for every country on all dates
-- This query calculates the percentage of the population that was infected with COVID-19 in a each country on all dates

select
    location,
    date,
    total_cases,
    population,
    (total_cases/population)*100 AS infection_percentage
from covid_deaths
ORDER BY
    location,
    date



-- Let's find the infection percentage for a specific country on all dates (in the following example i use my country Greece)
-- This query calculates the percentage of the population that was infected with COVID-19 in a specific country on all dates

select
    location,
    date,
    total_cases,
    population,
    (total_cases/population)*100 AS infection_percentage
from covid_deaths
WHERE
    location = 'Greece'
ORDER BY
    location,
    date



-- Let's find the infection percentage for every continent on all dates
-- This query calculates the percentage of the population that was infected with COVID-19 in each continent on all dates

select
    location,
    date,
    total_cases,
    population,
    (total_cases/population)*100 AS infection_percentage
from covid_deaths
WHERE
    continent is NULL
ORDER BY
    location,
    date


