--This query calculates the ICU admission rate as a percentage for each location and date, where data is available

SELECT
    location,
    date,
    total_cases,
    icu_patients,
    ROUND(CAST((icu_patients/NULLIF(total_cases, 0))*100 AS NUMERIC), 3) as icu_admission_rate
FROM
    covid_deaths
WHERE
    continent IS NOT NULL
ORDER BY
    location,
    date

--This query calculates the average ICU admission rate (as a percentage) for each location, rounding the result to three decimal places. It then retrieves the top 20 locations with the highest average ICU admission rates.


SELECT
    location,
    ROUND(AVG(CAST((icu_patients/NULLIF(total_cases, 0))*100 AS NUMERIC)), 3) as avg_icu_admission_rate
FROM
    covid_deaths
WHERE
    continent IS NOT NULL
GROUP BY
    location
HAVING
    AVG(ROUND(CAST((icu_patients/NULLIF(total_cases, 0))*100 AS NUMERIC), 3)) IS NOT NULL
ORDER BY
    avg_icu_admission_rate DESC
LIMIT 20
    


/*
Here is the breakdown:

Most locations have much lower average ICU admission rates, ranging from 0.119% to 0.612%.
This is within a normal range for ICU admissions relative to the total number of COVID-19 cases reported.
Many of the top locations with higher ICU admission rates are European countries, including Italy, Slovakia, Belgium, Slovenia, and others.
This might reflect regional healthcare systems, the impact of COVID-19 waves, or data reporting practices in these countries.
Non-European countries like Chile, Argentina, and South Africa also appear in the list,
but their rates are much lower compared to the peak value observed.

Explaining France’s High Rate:
The figure of 1482.439% is extraordinarily high and suggests that there may be a data error.
ICU admission rates are typically calculated as a percentage of total cases, so a rate above 100% indicates that
either the data has been misreported or that there is an issue with how ICU cases and total cases are recorded.

RESULTS

[
  {
    "location": "France",
    "avg_icu_admission_rate": "1482.439"
  },
  {
    "location": "Serbia",
    "avg_icu_admission_rate": "0.612"
  },
  {
    "location": "Italy",
    "avg_icu_admission_rate": "0.608"
  },
  {
    "location": "Slovakia",
    "avg_icu_admission_rate": "0.592"
  },
  {
    "location": "Belgium",
    "avg_icu_admission_rate": "0.347"
  },
  {
    "location": "Chile",
    "avg_icu_admission_rate": "0.319"
  },
  {
    "location": "Portugal",
    "avg_icu_admission_rate": "0.293"
  },
  {
    "location": "Slovenia",
    "avg_icu_admission_rate": "0.240"
  },
  {
    "location": "Sweden",
    "avg_icu_admission_rate": "0.235"
  },
  {
    "location": "Cyprus",
    "avg_icu_admission_rate": "0.217"
  },
  {
    "location": "United Kingdom",
    "avg_icu_admission_rate": "0.208"
  },
  {
    "location": "Denmark",
    "avg_icu_admission_rate": "0.194"
  },
  {
    "location": "Argentina",
    "avg_icu_admission_rate": "0.191"
  },
  {
    "location": "Germany",
    "avg_icu_admission_rate": "0.172"
  },
  {
    "location": "South Africa",
    "avg_icu_admission_rate": "0.165"
  },
  {
    "location": "South Korea",
    "avg_icu_admission_rate": "0.148"
  },
  {
    "location": "Bulgaria",
    "avg_icu_admission_rate": "0.148"
  },
  {
    "location": "Japan",
    "avg_icu_admission_rate": "0.136"
  },
  {
    "location": "Czechia",
    "avg_icu_admission_rate": "0.120"
  },
  {
    "location": "Austria",
    "avg_icu_admission_rate": "0.119"
  }
]
*/