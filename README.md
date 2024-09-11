# Introduction

With this project, I aim to explore the global impact of COVID-19 through data analysis. By examining COVID-19 death rates, vaccination coverage, and the association between COVID-19 and pre-existing medical conditions, the project provides a comprehensive overview of these figures for various countries and continents.

# Dataset

Covid-19 data from 1 Jan 2020 to 28 Jul 2024 from [Our World in Data](https://ourworldindata.org/covid-deaths).

# My Tools for the Project

- **PostgreSQL :** The powerhouse database that combines reliability with cutting-edge features.
- **VS Code :** Your ultimate code editor for seamless coding and debugging adventures.
- **SQL :** The language that brings your data to life with precision and power.
- **Git :** The version control wizard that keeps your code history tidy and collaborative.
- **GitHub :** Essential for sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# Exploring data

## 1. Calculate infection percentage
Let's find the infection percentage for every country on all dates

```sql
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
```

What about a specific country ? (in the following example i use my country Greece)

```sql
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
```

And for for every continent

```sql
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
```

## 2. Calculate death percentage
What is the percentage of the population that died from COVID-19 after being infected, for each country on all dates;

```sql
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
```
A calculation for a specific country (again in this example i use my country Greece)

```sql
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
```

And for for every continent

```sql
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
```
