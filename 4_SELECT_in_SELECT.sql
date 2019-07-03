-- List each country name where the population is larger than that of 'Russia'.

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

/*
Correct answer
name
Bangladesh
Brazil
China
India
Indonesia
Nigeria
Pakistan
United States
*/

-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

SELECT name FROM world
WHERE continent = 'Europe' AND (gdp / population) >
(SELECT (gdp / population) FROM world WHERE name = 'United Kingdom')

/*
Correct answer
name
Andorra
Austria
Belgium
Denmark
Finland
France
Germany
Iceland
Ireland
Liechtenstein
Luxembourg
Monaco
Netherlands
Norway
San Marino
Sweden
Switzerland
*/

-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

SELECT name, continent FROM world
WHERE continent =
(SELECT continent FROM world
WHERE name = 'Argentina') OR continent = (SELECT continent FROM world
WHERE name = 'Australia')
ORDER BY name

/*
Correct answer
name	continent
Argentina	South America
Australia	Oceania
Bolivia	South America
Brazil	South America
Chile	South America
Colombia	South America
Ecuador	South America
Fiji	Oceania
Guyana	South America
Kiribati	Oceania
Marshall Islands	Oceania
Micronesia, Federated States of	Oceania
Nauru	Oceania
New Zealand	Oceania
Palau	Oceania
Papua New Guinea	Oceania
Paraguay	South America
Peru	South America
Saint Vincent and the Grenadines	South America
Samoa	Oceania
Solomon Islands	Oceania
Suriname	South America
Tonga	Oceania
Tuvalu	Oceania
Uruguay	South America
Vanuatu	Oceania
Venezuela	South America
*/

-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.

SELECT name, population FROM world
WHERE population >
(SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland')

/*
Correct answer
name	population
Iraq	36004552
Sudan	37289406
*/

-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

SELECT name, concat(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100, 0), '%') AS 'population as % of Germany' FROM world
WHERE continent = 'Europe'

/*
Correct answer
name	population as..
Albania	3%
Andorra	0%
Austria	11%
Belarus	12%
Belgium	14%
Bosnia and Herzegovina	5%
Bulgaria	9%
Croatia	5%
Czech Republic	13%
Denmark	7%
Estonia	2%
Finland	7%
France	82%
Germany	100%
Greece	14%
Hungary	12%
Iceland	0%
Ireland	6%
Italy	75%
Kazakhstan	21%
Latvia	2%
Liechtenstein	0%
Lithuania	4%
Luxembourg	1%
Macedonia	3%
Malta	1%
Moldova	4%
Monaco	0%
Montenegro	1%
Netherlands	21%
Norway	6%
Poland	48%
Portugal	13%
Romania	25%
San Marino	0%
Serbia	9%
Slovakia	7%
Slovenia	3%
Spain	58%
Sweden	12%
Switzerland	10%
Ukraine	53%
United Kingdom	79%
Vatican City	0%
*/

-- Which countries have a GDP greater than every country in Europe?

SELECT name FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE gdp > 0 AND continent = 'Europe')

/*
Correct answer
name
China
Japan
United States
*/

-- Find the largest country (by area) in each continent, show the continent, the name and the area:

SELECT continent, name, area FROM world AS x
  WHERE area >= ALL
    (SELECT area FROM world AS y
        WHERE y.continent=x.continent
          AND population>0)
  
 /*
 Correct answer
continent	name	area
Africa	Algeria	2381741
Oceania	Australia	7692024
South America	Brazil	8515767
North America	Canada	9984670
Asia	China	9596961
Caribbean	Cuba	109884
Europe	Kazakhstan	2724900
Eurasia	Russia	17125242
*/

-- List each continent and the name of the country that comes first alphabetically.

SELECT continent, name FROM world AS x
WHERE name <= ALL
(SELECT name FROM world AS y
WHERE y.continent = x.continent)

/*
Correct answer
continent	name
Africa	Algeria
Asia	Afghanistan
Caribbean	Antigua and Barbuda
Eurasia	Armenia
Europe	Albania
North America	Belize
Oceania	Australia
South America	Argentina
*/

-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

SELECT name, continent, population FROM world AS x
WHERE 25000000 > ALL(SELECT population FROM world AS y
WHERE x.continent = y.continent AND population > 0)

/*
Correct answer
name	continent	population
Antigua and Barbuda	Caribbean	86295
Australia	Oceania	23545500
Bahamas	Caribbean	351461
Barbados	Caribbean	285000
Cuba	Caribbean	11167325
Dominica	Caribbean	71293
Dominican Republic	Caribbean	9445281
Fiji	Oceania	858038
Grenada	Caribbean	103328
Haiti	Caribbean	10413211
Jamaica	Caribbean	2717991
Kiribati	Oceania	106461
Marshall Islands	Oceania	56086
Micronesia, Federated States of	Oceania	101351
Nauru	Oceania	9945
New Zealand	Oceania	4538520
Palau	Oceania	20901
Papua New Guinea	Oceania	7398500
Saint Lucia	Caribbean	180000
Samoa	Oceania	187820
Solomon Islands	Oceania	581344
Tonga	Oceania	103036
Trinidad and Tobago	Caribbean	1328019
Tuvalu	Oceania	11323
Vanuatu	Oceania	264652
*/

-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.

SELECT name, continent FROM world AS x
WHERE population > ALL(SELECT population*3 FROM world AS y
WHERE y.continent = x.continent AND y.name != x.name)

/*
Correct answer
name	continent
Australia	Oceania
Brazil	South America
Russia	Eurasia
*/

