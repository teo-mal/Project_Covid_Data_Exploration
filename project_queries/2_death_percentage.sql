-- Let's find the death percentage for infected people, for every country on all dates
-- This query calculates the percentage of the population that died from COVID-19 after being infected, for each country on all dates

SELECT
    location,
    date,
    total_deaths,
    total_cases,
    population,
    (total_deaths/ NULLIF(total_cases, 0))*100 AS death_percentage
FROM 
    covid_deaths
ORDER BY
    location,
    date



-- Let's find the death percentage for infected people, for a specific country on all dates (in the following example i use my country Greece)
-- This query calculates the percentage of the population that died from COVID-19 after being infected, for a specific country on all dates

SELECT
    location,
    date,
    total_deaths,
    total_cases,
    population,
    (total_deaths/ NULLIF(total_cases, 0))*100 AS death_percentage
FROM
    covid_deaths
WHERE
    location = 'Greece'
ORDER BY
    location,
    date



-- Let's find the death percentage for infected people, for every continent on all dates
-- This query calculates the percentage of the population that died from COVID-19 after being infected, for each continent on all dates

SELECT
    location,
    date,
    total_deaths,
    total_cases,
    population,
    (total_deaths/ NULLIF(total_cases, 0))*100 AS death_percentage
FROM
    covid_deaths
WHERE
    continent is NULL
ORDER BY
    location,
    date
