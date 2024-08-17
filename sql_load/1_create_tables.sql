-- Create covid_deaths table 
CREATE TABLE public.covid_deaths
(
    iso_code TEXT,
    continent TEXT,
    location TEXT,
    date DATE,
    population FLOAT ,
    total_cases FLOAT,
    new_cases FLOAT,
    total_deaths FLOAT,
    new_deaths FLOAT,
    icu_patients FLOAT
);

-- Create covid_vaccinations table
CREATE TABLE public.covid_vaccinations
(
    iso_code TEXT,
    continent TEXT,
    location TEXT,
    date DATE,
    population FLOAT,
    total_vaccinations FLOAT,
    new_vaccinations FLOAT,
    aged_65_older INT,
    aged_70_older INT,
    cardiovasc_death_rate INT,
    diabetes_prevalence INT,
    female_smokers NUMERIC,
    male_smokers NUMERIC,
    handwashing_facilities INT
    
);


-- Set ownership of the tables to the postgres user
ALTER TABLE public.covid_deaths OWNER to postgres;
ALTER TABLE public.covid_vaccinations OWNER to postgres;
