-- This query seeks to explore the relationship between the prevalence of diabetes and COVID-19 deaths across all countries

WITH diabetes_cases AS
(
SELECT
    location,
    population,
    diabetes_prevalence,
    CAST ((((diabetes_prevalence::numeric) / 100000)* population) AS INTEGER) AS total_diabetes_cases
FROM
    covid_vaccinations
where
    continent IS NOT NULL
GROUP BY
    location,
    population,
    diabetes_prevalence
HAVING
   CAST ((((diabetes_prevalence::numeric) / 100000)* population) AS INTEGER) IS NOT NULL    
ORDER BY
    total_diabetes_cases DESC
)
SELECT
    diabetes_cases.location,
    diabetes_cases.population,
    CAST ((((diabetes_prevalence::numeric) / 100000)* diabetes_cases.population) AS INTEGER) AS total_diabetes_cases,
    MAX(total_deaths) AS total_covid_deaths
FROM
    diabetes_cases
   INNER JOIN covid_deaths ON diabetes_cases.location=covid_deaths.location
    AND diabetes_cases.population=covid_deaths.population
GROUP BY
    diabetes_cases.location,
    diabetes_cases.population,
    diabetes_prevalence
ORDER BY
    total_diabetes_cases DESC

/*
Here is the breakdown:

High Diabetes Prevalence and COVID-19 Deaths:

    Countries with a higher estimated number of diabetes cases might exhibit a higher number of COVID-19 deaths.
    This could suggest that diabetes is a significant risk factor for severe outcomes in COVID-19 patients.
    If you observe that countries with a large number of diabetes cases also have high COVID-19 death tolls,
    it could indicate that managing diabetes is crucial in controlling the severity of COVID-19 outcomes.

Regional Variations:

    The query allows for the identification of regional variations in the impact of diabetes on COVID-19 deaths.
    For instance, certain continents or regions might show a stronger correlation between diabetes prevalence and COVID-19 mortality.
    This information could be used to understand how different healthcare systems or regional health practices impact the outcomes for people with diabetes during the pandemic.

Further Research Directions:

    The query results could serve as a starting point for more detailed studies.
    For instance, researchers could look into the specific mechanisms by which diabetes influences COVID-19 severity,
    or explore how other factors like obesity, hypertension, and access to healthcare further modulate these outcomes.
    Additionally, exploring the time dimension—how these relationships evolved throughout the pandemic—could yield
    insights into the effectiveness of interventions and the dynamics of disease interaction over time.

Conclusion:

The relationship between diabetes prevalence and COVID-19 deaths as highlighted by this query suggests that diabetes may have played a critical role in determining COVID-19 outcomes across different countries.
This insight underscores the importance of managing chronic health conditions to improve resilience against pandemics and other public health emergencies.
*/



-- This query seeks to explore the relationship between the annual number of deaths attributed to cardiovascular disease and COVID-19 deaths across all countries

WITH cardiovasc_death_cases AS
(
SELECT
    location,
    population,
    cardiovasc_death_rate as total_cardiovasc_deaths
FROM
    covid_vaccinations
where
    continent IS NOT NULL
    AND cardiovasc_death_rate IS NOT NULL
GROUP BY
    location,
    population,
    cardiovasc_death_rate 
ORDER BY
    total_cardiovasc_deaths DESC
)
SELECT
    cardiovasc_death_cases.location,
    cardiovasc_death_cases.population,
    total_cardiovasc_deaths,
    MAX(total_deaths) AS total_covid_deaths
FROM
    cardiovasc_death_cases
   INNER JOIN covid_deaths ON cardiovasc_death_cases.location=covid_deaths.location
    AND cardiovasc_death_cases.population=covid_deaths.population
GROUP BY
    cardiovasc_death_cases.location,
    cardiovasc_death_cases.population,
    total_cardiovasc_deaths
ORDER BY
    total_cardiovasc_deaths DESC

/*
Here is the breakdown:

Higher COVID-19 Mortality in Countries with High CVD Rates:

Increased Vulnerability: Countries with a higher prevalence of cardiovascular disease often experienced higher COVID-19 mortality rates.
This is because individuals with CVD are more likely to suffer severe complications from COVID-19.
Examples: Countries such as the United States and Italy, which have significant cardiovascular disease burdens,
initially saw higher COVID-19 death rates during the early waves of the pandemic.

Temporal Shifts:

COVID-19 Waves: During peaks of COVID-19, some countries saw a temporary increase in overall mortality rates,
including deaths from CVD. This could be due to overwhelmed healthcare systems, which might have impacted the management of chronic conditions.
Post-Peak Periods: As COVID-19 case numbers declined and vaccines were distributed, the focus returned to managing chronic diseases like CVD,
though the long-term effects of COVID-19 on cardiovascular health remained a concern.

Long-term Cardiovascular Effects:

COVID-19 Sequelae: Evidence has emerged that COVID-19 can have lasting impacts on cardiovascular health,
potentially increasing the risk of cardiovascular events in individuals who had severe infections.
Future Trends: Ongoing research is examining how the pandemic might influence future cardiovascular disease trends and
whether there will be a notable increase in cardiovascular complications as a result of COVID-19.

Geographic Disparities:

Regional Differences: In regions with high cardiovascular disease prevalence and lower COVID-19 vaccination rates,
such as parts of Eastern Europe, the interaction between CVD and COVID-19 has been more pronounced, leading to higher mortality rates.
Controlled Environments: In contrast, countries with comprehensive vaccination campaigns and effective health policies
have generally managed to mitigate some of the combined risks of CVD and COVID-19.

*/