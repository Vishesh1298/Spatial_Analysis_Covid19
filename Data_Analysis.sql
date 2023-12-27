-- STEP 1: Creating and updating the geom column

ALTER TABLE covid_data
ADD COLUMN location geometry (Point ,4326) ;

UPDATE covid_data
SET location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326);


-- STEP 2: Creating and Updating Mortality column

ALTER TABLE covid_data
ADD COLUMN mortality NUMERIC (24, 15);

UPDATE covid_data
SET mortality = (deaths / confirmed) * 100;


-- STEP 3: Creating a view with Confirmed Cases and of top 5 countries

DROP VIEW IF EXISTS Confirmed_Cases_view;

CREATE VIEW Confirmed_Cases_view AS
SELECT
    country,
    confirmed,
	location
FROM
    covid_data;
	
	
CREATE VIEW top_confirmed_countries AS
SELECT
    country,
    confirmed,
    location
FROM (
    SELECT
        country,
        confirmed,
        location,
        ROW_NUMBER() OVER (ORDER BY confirmed DESC) as row_num
    FROM
        covid_data
) ranked_data
WHERE row_num <= 5;

-- STEP 4: Creating a view with Mortality and of top 5 countries

DROP VIEW IF EXISTS AllDeaths_view;

CREATE VIEW Deaths_view AS
SELECT
    country,
    mortality,
	location
FROM
    covid_data;
	
CREATE VIEW top_deaths_countries AS
SELECT
    country,
    mortality,
    location
FROM (
    SELECT
        country,
        mortality,
        location,
        ROW_NUMBER() OVER (ORDER BY mortality DESC) as row_num
    FROM
        covid_data
) ranked_data
WHERE row_num <= 5;