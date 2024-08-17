-- Lets find every country's total death percentage for infected population
-- This query calculates the total death percentage among people infected with COVID-19 for each country

select
    location,
    population,
    MAX(total_cases) as total_infected_count,
    MAX(total_deaths) as total_death_count,
    (MAX(total_deaths)/ NULLIF (MAX(total_cases), 0))*100 AS total_death_percentage
from covid_deaths 
GROUP BY
    location,
    population
HAVING
    (MAX(total_deaths)/ NULLIF (MAX(total_cases), 0))*100 is not NULL
ORDER BY
    total_death_percentage DESC