# Top Quality Coffee Bean Production Chain
---
## Project Summary
This project was investigating the selection of coffee beans and their production chain in the top quality coffee blends. To understand the coffee plant variants and properities of top quality coffee blends, the data was mined from world coffee search and coffee review institute. The top quality coffee rated by coffee review stated that more than 60% of top quality coffee are medium-light level. Most of the top quality selected the Geisha variants, followed by Bourbon and Typcia variants in their coffee blend. Moreover, aprroximately 25% of the coffee blend selected Ethiopia-grown coffee beans. This might because the average altitude in Ethiopia is higher than other countries and the altitude of coffee plants growth will highly influence the coffee bean quality.

---

### Collecting data from website (web scaping)

<b>Programming language and package used:</b> Python (BeautifulSoup and request) </br>
Data from this project was collected from two different coffee organization [World Coffee Research](https://worldcoffeeresearch.org) and [Coffee Review](https://www.coffeereview.com/). Different Arabica coffee varianties information was scraped using [coffee_varieties_worldcoffeeresearch](https://github.com/wingylui/Self-project_Coffee/blob/main/web_scaping/coffee_varieties_worldcoffeeresearch.ipynb); the top quality coffee bean information was scraped using [top_rated_coffee_coffeereview] (https://github.com/wingylui/Self-project_Coffee/blob/main/web_scaping/top_rated_coffee_coffeereview.ipynb). All the information from these two websites was scraped by using requests and BeautifulSoup, and re-organised into Pandas dataframe format, which then exported as a CSV file.


### Cleaning and transforming data

<b>Programming language and package used:</b> Python (Pandas, numpy and geopy) </br>
Cleaning and transforming data was done in [coffee_review_data_cleaning](https://github.com/wingylui/Self-project_Coffee/blob/main/coffee_review_data_cleaning.ipynb). The top quality coffee bean data was unstructured and unorganised. Hence, the output file from web scaping was firstly modified in excel to ensure all information is in a conventional pattern. The semi-cleaned coffee bean data was then imported into python for identifying arabica variants name within a paragraph. To ensure most variants name is extracted, different name from the same species was searched and replaced it as the offical variant name stated in world coffee research. Moreover, geopy was used to search the country name to ensure the dataset is providing accurate country name. </br>

The data was then transformed into mulitple tables for storing in PostregSQL database. The database layout was firstly designed and mapped in entity relationship diagram showed as below. All the primary keys were generated and imported into all the nine tables and merged them according to the foregin keys. The nine cleaned csv files were stored in [cleaned_csv file](https://github.com/wingylui/Self-project_Coffee/tree/main/cleaned_csv). </br>

<b>Coffee Bean Entity Relationship Diagram:</b></br>
```mermaid
---
title: Coffee Species ERD
---
erDiagram
    SPECIES_INFO ||--|{ SPECIES_LINK : From
    SPECIES_INFO{
        VARCHAR(6) species_id PK
        VARCHAR(21) species_name
        VARCHAR(15) plant_stature
        VARCHAR(16) leaf_colour
        VARCHAR(15) bean_size
        VARCHAR(15) altitude_low_lat
        VARCHAR(15) altitude_medium_lat
        VARCHAR(15) altitude_high_lat
        VARCHAR(15) quality_at_high_altitude
        VARCHAR(15) yield_potential
        VARCHAR(15) CLR_resistant
        VARCHAR(15) CBD_resistant
        VARCHAR(15) nematodes_resistant
        VARCHAR(15) nutrition_require
        VARCHAR(3) species_id FK
    }

    SPECIES_LINK }|--|| COFFEE_MAIN : From
    SPECIES_LINK{
        VARCHAR(5) coffee_ID FK
        VARCHAR(6) species_coffee_id PK
        VARCHAR(3) species_id FK

    }

    COFFEE_MAIN ||--|{ ORIGIN : Grow_in
    COFFEE_MAIN {
        VARCHAR(5) coffee_ID PK
        VARCHAR(90) coffee_name
        Date review_date
        INT coffee_rating
        INT agtron_WB
        INT agtron_AG
        INT aroma
        INT acidity
        INT body
        INT flavor
        INT aftertaste
        VARCHAR(3) roast_lv_id FK
        VARCHAR(4) roaster_ID FK
        FLOAT price_per_kg_USD
    }

    ROASTER ||--|{ COFFEE_MAIN : made_by
    ROASTER{
        VARCHAR(4) raoster_id PK
        VARCHAR(40) raoster_name
        VARCHAR(7) city_id FK
    }

    CITY }|--|| ROASTER : in
    CITY{
        VARCHAR(30) roaster_city 
        VARCHAR(7) city_ID PK
        VARCHAR(6) country_id FK
    }

    ORIGIN ||--|{ COUNTRY : in
    ORIGIN {
        VARCHAR(5) coffee_ID FK
        VARCHAR(5) origin_id PK
        VARCHAR(6) coffee_origin_country_id FK
    }

    COUNTRY ||--|{ CITY : in
    COUNTRY{
        VARCHAR(6) country_id PK
        VARCHAR(40) country_name
    }

    ROAST_LEVEL ||--|{ COFFEE_MAIN : Roasted
    ROAST_LEVEL{
        VARCHAR(12) roast_level
        VARCHAR(3) roast_lv_id PK,FK
    }
```

### Creating Database and Query required information

<b>Progrmaming language and package used:</b> SQL (PostgreSQL)</br>
All nine tables were created using the script in [create_table](https://github.com/wingylui/Self-project_Coffee/blob/main/PostgreSQL/create_table.sql) with all the format types, primary and foreign keys labelled. After confirming all the csv files are loaded probably, the required data was extracted [(Script)](https://github.com/wingylui/Self-project_Coffee/blob/main/PostgreSQL/obtain_required_data.sql) and stored in [output_csv file](https://github.com/wingylui/Self-project_Coffee/tree/main/PostgreSQL/output_CSV).

### Data Visualisation 

<b>Data Visualization Tools:</b> PowerBI</br>
The three csv files were imported and merged in PowerBI. A dashboard was created in PowerBI for data visualization. </br>

PowerBI visualisation example:
![POWERBI_Geisha](https://github.com/wingylui/Self-project_Coffee/blob/main/PowerBI/coffee_species_dashboard_example.png)


---
## References:
- [World Coffee Research](https://worldcoffeeresearch.org)
- [Coffee Review](https://www.coffeereview.com/)
