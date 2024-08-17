COPY covid_deaths
FROM 'C:\Users\User\Desktop\portofolio projects\Project_Covid_Data_Exploration\csv_files\covid_deaths.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY covid_vaccinations
FROM 'C:\Users\User\Desktop\portofolio projects\Project_Covid_Data_Exploration\csv_files\covid_vaccinations.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');



/*
\copy covid_deaths FROM 'C:\Users\User\Desktop\portofolio projects\Project_Covid_Data_Exploration\csv_files\covid_deaths.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy covid_vaccinations FROM 'C:\Users\User\Desktop\portofolio projects\Project_Covid_Data_Exploration\csv_files\covid_vaccinations.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/