-- Let' s group some results for the infected population by continents
-- This query calculates the total number of COVID-19 infected population for each continent plus some economic comparisons 


SELECT
    location,
    MAX(total_cases) as total_infection_count
FROM
    covid_deaths
WHERE
    continent is NULL
GROUP BY
    location
ORDER BY
    MAX(total_cases) DESC

/*
Here is the breakdown:
High-Income Countries and Asia have the highest infection counts.
Europe and Upper-Middle-Income Countries follow closely.
Low-Income Countries and Africa have the lowest counts, which might be due to less extensive testing and different population dynamics.
Oceania shows relatively low infection counts, likely due to its geographical isolation and smaller population. 

Reporting and Data Discrepancies:
Variations in reported infection counts could be influenced by differences in healthcare infrastructure, testing availability, and reporting practices.

Impact of Economic Status:
The higher infection counts in high-income and upper-middle-income countries might reflect their extensive testing and reporting capabilities rather than just the number of infections.
Conversely, lower counts in low-income countries could be due to less access to testing and healthcare services.

Geographical Impact:
 Regions with high population densities and extensive international travel, such as Europe and Asia, naturally report higher infection numbers.

These insights can help in understanding the global spread of COVID-19 and the varying impacts across different regions and income levels.

RESULTS

[
  {
    "location": "World",
    "total_infection_count": 775829432
  },
  {
    "location": "High-income countries",
    "total_infection_count": 429016663
  },
  {
    "location": "Asia",
    "total_infection_count": 301493093
  },
  {
    "location": "Europe",
    "total_infection_count": 252882826
  },
  {
    "location": "Upper-middle-income countries",
    "total_infection_count": 251749754
  },
  {
    "location": "European Union (27)",
    "total_infection_count": 185801974
  },
  {
    "location": "North America",
    "total_infection_count": 124491551
  },
  {
    "location": "Lower-middle-income countries",
    "total_infection_count": 91948242
  },
  {
    "location": "South America",
    "total_infection_count": 68820661
  },
  {
    "location": "Oceania",
    "total_infection_count": 14996189
  },
  {
    "location": "Africa",
    "total_infection_count": 13145112
  },
  {
    "location": "Low-income countries",
    "total_infection_count": 1944296
  }
]
*/



-- Let' s group some results for the population that died from COVID-19 after being infected, by continents
-- This query calculates the total number of population that died from COVID-19 after being infected for each continent plus some economic comparisons

SELECT
    location,
    MAX(total_deaths) as total_death_count
FROM
    covid_deaths
WHERE
    continent is NULL
GROUP BY
    location
ORDER BY
    MAX(total_deaths) DESC 

/*
Here is the breakdown:
Impact of Income Levels:
Higher-income countries have higher death counts, possibly due to better reporting and higher population ages. Conversely, lower-income regions show lower death counts, potentially due to underreporting or differences in population age demographics.
Regional Response and Impact:
Europe and North America, with their extensive international travel and aging populations, experienced severe impacts early in the pandemic. Asia and South America also faced significant challenges, though the nature and timing of outbreaks varied across these regions.
Underreporting and Healthcare Disparities:
The differences between continents and income groups highlight potential disparities in healthcare access, response strategies, and the accuracy of reported data, with lower-income and less developed regions potentially underreporting due to limited resources.
This data provides a clear picture of how different regions and income groups were affected by the pandemic in terms of total deaths, offering valuable context for public health analysis and future preparedness efforts.  

RESULTS

[
  {
    "location": "World",
    "total_death_count": 7056095
  },
  {
    "location": "High-income countries",
    "total_death_count": 2996341
  },
  {
    "location": "Upper-middle-income countries",
    "total_death_count": 2824433
  },
  {
    "location": "Europe",
    "total_death_count": 2102307
  },
  {
    "location": "North America",
    "total_death_count": 1670327
  },
  {
    "location": "Asia",
    "total_death_count": 1637232
  },
  {
    "location": "South America",
    "total_death_count": 1354210
  },
  {
    "location": "European Union (27)",
    "total_death_count": 1262824
  },
  {
    "location": "Lower-middle-income countries",
    "total_death_count": 1188026
  },
  {
    "location": "Africa",
    "total_death_count": 259117
  },
  {
    "location": "Low-income countries",
    "total_death_count": 43529
  },
  {
    "location": "Oceania",
    "total_death_count": 32902
  }
]
*/

-- This query calculates the percentage of global population that died after was infected by COVID-19 for every date where data is available. The query groups the data by each date.

SELECT
    date,
    MAX(total_cases) as total_infected_count,
    MAX(total_deaths) as total_death_count,
    (MAX(total_deaths)/ NULLIF (MAX(total_cases), 0))*100 AS total_death_percentage
FROM
    covid_deaths
WHERE
    continent is not NULL
GROUP BY
    date
HAVING
    (MAX(total_deaths)/ NULLIF (MAX(total_cases), 0))*100 is not NULL
ORDER BY
    date,
    MAX(total_cases)




-- This SQL query calculates the total percentage of global population that died after was infected by COVID-19.

    SELECT
    MAX(total_cases) as total_infected_count,
    MAX(total_deaths) as total_death_count,
    (MAX(total_deaths)/ NULLIF (MAX(total_cases), 0))*100 AS total_death_percentage
FROM
    covid_deaths
WHERE
    continent is not NULL
HAVING
    (MAX(total_deaths)/ NULLIF (MAX(total_cases), 0))*100 is not NULL
ORDER BY
    MAX(total_cases)

/*
RESULTS

[
  {
    "total_infected_count": 103436829,
    "total_death_count": 1192328,
    "total_death_percentage": 1.1527112842950744
  }
]
*/

