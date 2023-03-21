-- checking the number of unique coffee species
SELECT species_name FROM SPECIES_INFO LIMIT 100;

-- agtron (whole bean),roast level and coffee price
SELECT COFFEE.coffee_name, COFFEE.agtron_WB, R.roast_level, COFFEE.price_per_kg_USD
FROM COFFEE_MAIN AS COFFEE
INNER JOIN ROAST_LEVEL AS R ON R.roast_lv_id = COFFEE.roast_lv_id

-- identifying the species diversity in different country
SELECT  COFFEE.coffee_name, S.species_name, COUNTRY.country_name AS origin_country_name
FROM SPECIES_INFO AS S
INNER JOIN SPECIES_LINK ON SPECIES_LINK.species_id = S.species_id
INNER JOIN COFFEE_MAIN AS COFFEE ON COFFEE.coffee_id = SPECIES_LINK.coffee_id
INNER JOIN ORIGIN AS O ON O.coffee_id = COFFEE.coffee_id
INNER JOIN COUNTRY ON COUNTRY.country_id = O.coffee_origin_country_id;

-- coffee from roaster and their location
SELECT COFFEE.coffee_name, S.species_name, R.raoster_name AS roaster_name, CITY.roaster_city,
	COUNTRY.country_name AS roaster_country_name
FROM SPECIES_INFO AS S
INNER JOIN SPECIES_LINK ON SPECIES_LINK.species_id = S.species_id
INNER JOIN COFFEE_MAIN AS COFFEE ON COFFEE.coffee_id = SPECIES_LINK.coffee_id
INNER JOIN ROASTER AS R ON R.roaster_id = COFFEE.roaster_id
INNER JOIN ROASTER_CITY_LINK ON ROASTER_CITY_LINK.roaster_id = R.roaster_id
INNER JOIN CITY ON CITY.city_id = ROASTER_CITY_LINK.city_id
INNER JOIN COUNTRY ON COUNTRY.country_id = CITY.country_id;
	
	

	
