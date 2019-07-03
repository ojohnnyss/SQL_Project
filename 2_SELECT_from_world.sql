-- Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world

--  Show the name for the countries that have a population of at least 200 million.

SELECT name FROM world
WHERE population > 200000000

/*
Correct answer
name
Brazil
China
India
Indonesia
United States
*/

-- Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, gdp / population AS 'per capita GDP'
FROM world
WHERE population > 200000000;

/*
Correct answer
name	per capita GDP
Brazil	11115.2648
China	6121.7106
India	1504.7931
Indonesia	3482.0205
United States	51032.2945
*/

-- Show the name and population in millions for the countries of the continent 'South America'.

SELECT name, population / 1000000
FROM world
WHERE continent = 'South America'

/*
Correct answer
name	population / ..
Argentina	42.6695
Bolivia	10.0273
Brazil	202.7940
Chile	17.7730
Colombia	47.6620
Ecuador	15.7742
Guyana	0.7849
Paraguay	6.7834
Peru	30.4751
Saint Vincent and the Grenadines	0.1090
Suriname	0.5342
Uruguay	3.2863
Venezuela	28.9461
*/

-- Show the name and population for France, Germany, Italy

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

/*
Correct answer
name	population
France	65906000
Germany	80716000
Italy	60782668
*/

-- Show the countries which have a name that includes the word 'United'

SELECT name
FROM world
WHERE name LIKE 'United%'

/*
Correct answer
name
United Arab Emirates
United Kingdom
United States
*/

-- Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

/*
Correct answer
name	population	area
Australia	23545500	7692024
Brazil	202794000	8515767
Canada	35427524	9984670
China	1365370000	9596961
India	1246160000	3166414
Indonesia	252164800	1904569
Russia	146000000	17125242
United States	318320000	9826675
*/

-- Show the countries that are big by area or big by population but not both. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000

/*
Correct answer
name	population	area
Australia	23545500	7692024
Brazil	202794000	8515767
Canada	35427524	9984670
Indonesia	252164800	1904569
Russia	146000000	17125242
*/

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

SELECT name, ROUND(population / 1000000, 2) AS population, ROUND(gdp / 1000000000, 2) AS gdp
FROM world
WHERE continent = 'South America'

/*
Correct answer
name	population	gdp
Argentina	42.67	477.03
Bolivia	10.03	27.04
Brazil	202.79	2254.11
Chile	17.77	268.31
Colombia	47.66	369.81
Ecuador	15.77	87.50
Guyana	0.78	2.85
Paraguay	6.78	25.94
Peru	30.48	204.68
Saint Vincent and the Grenadines	0.11	0.69
Suriname	0.53	5.01
Uruguay	3.29	49.92
Venezuela	28.95	382.42
*/

-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion. Round this value to the nearest 1000.

SELECT name, ROUND((gdp/population), -3) AS 'per capita GDP'
FROM world
WHERE gdp > 1000000000000

/*
Correct answer
name	per capita GDP
Australia	66000
Brazil	11000
Canada	45000
China	6000
France	40000
Germany	42000
India	2000
Italy	33000
Japan	47000
Mexico	10000
Russia	14000
South Korea	22000
Spain	28000
United Kingdom	39000
United States	51000
*/

-- Show the name and capital where the name and the capital have the same number of characters.

SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

/*
Correct answer
name	capital
Algeria	Algiers
Angola	Luanda
Armenia	Yerevan
Botswana	Gaborone
Cameroon	Yaoundé
Canada	Ottowa
Djibouti	Djibouti
Egypt	Cairo
Estonia	Tallinn
Fiji	Suva
Gambia	Banjul
Georgia	Tbilisi
Ghana	Accra
Greece	Athens
Luxembourg	Luxembourg
Mauritania	Nouakchott
Peru	Lima
Poland	Warsaw
Russia	Moscow
Rwanda	Kigali
San Marino	San Marino
Singapore	Singapore
Taiwan	Taipei
Turkey	Ankara
Zambia	Lusaka
*/

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name != capital

/*
Correct answer
name	capital
Algeria	Algiers
Andorra	Andorra la Vella
Barbados	Bridgetown
Belize	Belmopan
Brazil	Brasília
Brunei	Bandar Seri Begawan
Burundi	Bujumbura
Guatemala	Guatemala City
Guyana	Georgetown
Kuwait	Kuwait City
Maldives	Malé
Marshall Islands	Majuro
Mexico	Mexico City
Monaco	Monaco-Ville
Mozambique	Maputo
Niger	Niamey
Panama	Panama City
Papua New Guinea	Port Moresby
Sao Tomé and Príncipe	São Tomé
South Korea	Seoul
Sri Lanka	Sri Jayawardenepura Kotte
Sweden	Stockholm
Taiwan	Taipei
Tunisia	Tunis
*/

-- Find the country that has all the vowels and no spaces in its name.

SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %'

/*
Correct answer
name
Mozambique
*/


