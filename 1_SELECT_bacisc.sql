-- Modify query to show the population of Germany

SELECT population FROM world
  WHERE name = 'Germany'
  
  /*
  Correct answer
  population
  80716000
  */

-- Query to show name and the population for 'Sweden', 'Norway' and 'Denmark'

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
  
  /*
  Correct answer
  name	population
  Denmark	5634437
  Norway	5124383
  Sweden	9675885
  */
  
  -- Modify query to show the country and the area for countries with an area between 200,000 and 250,000.
  
  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
  
/*
Correct answer
name	area
Belarus	207600
Ghana	238533
Guinea	245857
Guyana	214969
Laos	236800
Romania	238391
Uganda	241550
United Kingdom	242900
*/
