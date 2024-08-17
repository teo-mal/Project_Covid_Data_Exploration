--This query calculates the percentage of the population that has been vaccinated at least once against COVID-19 for each location and date where data is available. The percentage is calculated by dividing the total number of vaccinations by the population for each location on a specific date.

SELECT
    covid_deaths.continent,
    covid_deaths.location,
    covid_deaths.date,
    covid_vaccinations.total_vaccinations,
    covid_deaths.population,
    (covid_vaccinations.total_vaccinations/covid_deaths.population)*100 AS vaccinated_percentage
FROM
    covid_deaths
    JOIN covid_vaccinations
        ON covid_deaths.location=covid_vaccinations.location
        AND covid_deaths.date=covid_vaccinations.date
WHERE 
    covid_deaths.continent IS NOT NULL
ORDER BY
    covid_deaths.location,covid_deaths.date  



--This query calculates the percentage of people vaccinated against covid at least once, group by continents.

SELECT
    covid_vaccinations.location,
    MAX(covid_vaccinations.total_vaccinations),
    MAX(covid_deaths.population),
    (MAX(covid_vaccinations.total_vaccinations)/MAX(covid_deaths.population))*100 AS total_vaccinated_percentage
FROM
    covid_deaths
    JOIN covid_vaccinations
        ON covid_deaths.location=covid_vaccinations.location
        AND covid_deaths.date=covid_vaccinations.date
WHERE 
    covid_deaths.continent IS NULL
GROUP BY
    covid_vaccinations.location
ORDER BY
    (MAX(covid_vaccinations.total_vaccinations)/MAX(covid_deaths.population))*100

/*
Here is the breakdown:
    High Vaccination Coverage in Developed Regions:
    High-income countries and regions like Europe and North America show very high vaccination percentages, well over 100%.
    This suggests that many individuals have received multiple doses, as the total vaccinations exceed the population count.
    For example, High-income countries have a vaccination percentage of 227.18%,
    indicating a high level of coverage and the likely administration of booster doses.

    Global Vaccination Efforts:
    The World as a whole has a vaccination percentage of 170.26%, which is indicative of a global effort where many people have received more than one dose.

    Disparities in Low-Income Regions:
    Low-income countries have a significantly lower vaccination percentage of 45.21%.
    This highlights the challenges in vaccine distribution and access in these regions.
    Similarly, Africa shows a vaccination percentage of 60.50%, which, while higher than low-income countries, still lags behind other regions.

    Over-100% Vaccination Rates in Some Regions:
    Regions like Europe (187.88%), Asia (192.83%), North America (192.99%), and Oceania (196.15%) all have vaccination percentages nearing or exceeding 200%.
    This suggests extensive use of multiple vaccine doses, including boosters.

    Economic Disparities:
    Upper-middle-income countries (215.76%) and Lower-middle-income countries (144.35%) show significant vaccination efforts,
    but the disparity between middle-income and low-income countries is stark.
    This highlights the economic factor in vaccine accessibility and distribution, with wealthier regions achieving higher vaccination rates.

Summary:

The data illustrates significant global disparities in vaccination rates, with wealthier regions achieving much higher coverage,
often exceeding 100%, due to multiple doses administered. In contrast, low-income regions, particularly in Africa,
have struggled to achieve even 50% coverage. This highlights ongoing challenges in equitable vaccine distribution and the need for continued efforts to support vaccination in under-resourced areas.

RESULTS:

[
  {
    "location": "Low-income countries",
    "max": 333448906,
    "max (1)": 737604900,
    "total_vaccinated_percentage": 45.20698086468786
  },
  {
    "location": "Africa",
    "max": 863237900,
    "max (1)": 1426736614,
    "total_vaccinated_percentage": 60.504363000808226
  },
  {
    "location": "Lower-middle-income countries",
    "max": 4954377346,
    "max (1)": 3432097300,
    "total_vaccinated_percentage": 144.3542217174321
  },
  {
    "location": "World",
    "max": 13578755955,
    "max (1)": 7975105024,
    "total_vaccinated_percentage": 170.26429011450722
  },
  {
    "location": "Europe",
    "max": 1399334097,
    "max (1)": 744807803,
    "total_vaccinated_percentage": 187.8785495215871
  },
  {
    "location": "Asia",
    "max": 9104302147,
    "max (1)": 4721383370,
    "total_vaccinated_percentage": 192.83124104789653
  },
  {
    "location": "North America",
    "max": 1158547416,
    "max (1)": 600323657,
    "total_vaccinated_percentage": 192.98713327234412
  },
  {
    "location": "Oceania",
    "max": 88342990,
    "max (1)": 45038860,
    "total_vaccinated_percentage": 196.14837054046217
  },
  {
    "location": "European Union (27)",
    "max": 951113179,
    "max (1)": 450146793,
    "total_vaccinated_percentage": 211.28956015910126
  },
  {
    "location": "Upper-middle-income countries",
    "max": 5449980906,
    "max (1)": 2525921300,
    "total_vaccinated_percentage": 215.7621025643198
  },
  {
    "location": "South America",
    "max": 964991405,
    "max (1)": 436816679,
    "total_vaccinated_percentage": 220.91450518994492
  },
  {
    "location": "High-income countries",
    "max": 2840861684,
    "max (1)": 1250514600,
    "total_vaccinated_percentage": 227.1754111467391
  }
]
*/

