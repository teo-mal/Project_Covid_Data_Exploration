-- Lets find every country's total infection percentage
-- This query calculates the total infection percentage from COVID-19 for each country
select
    location,
    population,
    MAX(total_cases) as total_infected_count,
    (MAX(total_cases) / population) * 100 AS total_infection_percentage
from covid_deaths 
GROUP BY
    location,
    population
HAVING
   (MAX(total_cases)/population)*100 is not NULL
ORDER BY
    total_infection_percentage DESC


    