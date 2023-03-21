CREATE TABLE SPECIES_INFO(
	species_name VARCHAR(21) NOT NULL,
	plant_stature VARCHAR(15),
	leaf_colour VARCHAR(16),
	bean_size VARCHAR(15),
	altitude_low_lat VARCHAR(15),
	altitude_medium_lat VARCHAR(15),
	altitude_high_lat VARCHAR(15), 
	quality_at_high_altitude VARCHAR(15),
	yield_potential VARCHAR(15),
	CLR_resistant VARCHAR(15),
	CBD_resistant VARCHAR(15),
	nematodes_resistant VARCHAR(15),
	nutrition_require VARCHAR(15),
	species_id VARCHAR(3) PRIMARY KEY);

CREATE TABLE COUNTRY(
	country_id VARCHAR(6) PRIMARY KEY,
	country_name VARCHAR(40));
	
CREATE TABLE ROAST_LEVEL(
	roast_level VARCHAR(12) NOT NULL,
	roast_lv_id VARCHAR(3) PRIMARY KEY);

CREATE TABLE ROASTER(
	roaster_name VARCHAR(40) NOT NULL,
	roaster_id VARCHAR(4) PRIMARY KEY);
		
CREATE TABLE CITY(
	roaster_city VARCHAR(30),
	city_ID VARCHAR(7) PRIMARY KEY,
	country_id VARCHAR(6),
	FOREIGN KEY (country_id) REFERENCES COUNTRY(country_id));

CREATE TABLE ROASTER_CITY_LINK(
	roaster_city_id VARCHAR(5) PRIMARY KEY,
	roaster_ID VARCHAR(4),
	city_ID VARCHAR(7),
	FOREIGN KEY (city_ID) REFERENCES CITY(city_ID),
	FOREIGN KEY (roaster_ID) REFERENCES ROASTER(roaster_id));

CREATE TABLE COFFEE_MAIN(
	coffee_id VARCHAR(5) PRIMARY KEY,
	coffee_name VARCHAR(90) NOT NULL,
	review_date DATE,
	coffee_rating INT,
	agtron_WB INT,
	agtron_AG INT,
	aroma INT,
	acidity INT,
	body INT,
	flavor INT,
	aftertaste INT,
	roast_lv_id VARCHAR(3),
	roaster_ID VARCHAR(4),
	price_per_kg_USD FLOAT,
	FOREIGN KEY (roast_lv_id) REFERENCES ROAST_LEVEL(roast_lv_id),
	FOREIGN KEY (roaster_ID) REFERENCES ROASTER(roaster_id));

CREATE TABLE ORIGIN(
	coffee_id VARCHAR(5),
	origin_id VARCHAR(5) PRIMARY KEY,
	coffee_origin_country_id VARCHAR(6),
	FOREIGN KEY (coffee_id) REFERENCES COFFEE_MAIN(coffee_id),
	FOREIGN KEY (coffee_origin_country_id) REFERENCES COUNTRY(country_id));
	
CREATE TABLE SPECIES_LINK(
	coffee_ID VARCHAR(5),
	species_coffee_id VARCHAR(6) PRIMARY KEY,
	species_id VARCHAR(3),
	FOREIGN KEY (coffee_ID) REFERENCES COFFEE_MAIN(coffee_id),
	FOREIGN KEY (species_id) REFERENCES SPECIES_INFO(species_id));