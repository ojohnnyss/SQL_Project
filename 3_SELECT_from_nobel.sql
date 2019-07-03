-- Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 
 /*
 Correct answer
yr	subject	winner
1950	Chemistry	Kurt Alder
1950	Chemistry	Otto Diels
1950	Literature	Bertrand Russell
1950	Medicine	Philip S. Hench
1950	Medicine	Edward C. Kendall
1950	Medicine	Tadeus Reichstein
1950	Peace	Ralph Bunche
1950	Physics	Cecil Powell
*/

-- Show who won the 1962 prize for Literature.

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
   
   /*
   Correct answer
winner
John Steinbeck
*/

-- Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr, subject FROM nobel
WHERE winner = 'Albert Einstein'

/*
Correct answer
yr	subject
1921	Physics
*/

-- Give the name of the 'Peace' winners since the year 2000, including 2000.

SELECT winner FROM nobel
WHERE subject = 'Peace' AND yr >= 2000

/*
Correct answer
winner
Tunisian National Dialogue Quartet
Kailash Satyarthi
Malala Yousafzai
European Union
Ellen Johnson Sirleaf
Leymah Gbowee
Tawakel Karman
Liu Xiaobo
Barack Obama
Martti Ahtisaari
Intergovernmental Panel on Climate Change
Al Gore
Grameen Bank
Muhammad Yunus
International Atomic Energy Agency
Mohamed ElBaradei
Wangari Maathai
Shirin Ebadi
Jimmy Carter
United Nations
Kofi Annan
Kim Dae-jung
*/

-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

SELECT * FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989

/*
Correct answer
yr	subject	winner
1989	Literature	Camilo José Cela
1988	Literature	Naguib Mahfouz
1987	Literature	Joseph Brodsky
1986	Literature	Wole Soyinka
1985	Literature	Claude Simon
1984	Literature	Jaroslav Seifert
1983	Literature	William Golding
1982	Literature	Gabriel García Márquez
1981	Literature	Elias Canetti
1980	Literature	Czeslaw Milosz
*/

-- Show all details of the presidential winners: Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')
 
 /*
 Correct answer
yr	subject	winner
2009	Peace	Barack Obama
2002	Peace	Jimmy Carter
1919	Peace	Woodrow Wilson
1906	Peace	Theodore Roosevelt
*/

-- Show the winners with first name John

SELECT winner FROM nobel
WHERE winner LIKE 'John %'

/*
Correct answer
winner
John O'Keefe
John B. Gurdon
John C. Mather
John L. Hall
John B. Fenn
John E. Sulston
John Pople
John Hume
John E. Walker
John C. Harsanyi
John F. Nash Jr.
John C. Polanyi
John R. Vane
John H. van Vleck
John Cornforth
John R. Hicks
John Bardeen
John C. Kendrew
John Steinbeck
John Bardeen
John F. Enders
John Cockcroft
John H. Northrop
John R. Mott
John Galsworthy
John Macleod
*/

-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984

SELECT yr, subject, winner FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984)

/*
Correct answer
yr	subject	winner
1984	Chemistry	Bruce Merrifield
1980	Physics	James Cronin
1980	Physics	Val Fitch
*/

-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

SELECT * FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')

/*
Correct answer
yr	subject	winner
1980	Economics	Lawrence R. Klein
1980	Literature	Czeslaw Milosz
1980	Peace	Adolfo Pérez Esquivel
1980	Physics	James Cronin
1980	Physics	Val Fitch
*/

-- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT * FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)

/*
Correct answer
yr	subject	winner
2015	Literature	Svetlana Alexievich
2014	Literature	Patrick Modiano
2013	Literature	Alice Munro
2012	Literature	Mo Yan
2011	Literature	Tomas Tranströmer
2010	Literature	Mario Vargas Llosa
2009	Literature	Herta Müller
2008	Literature	Jean-Marie Gustave Le Clézio
2007	Literature	Doris Lessing
2006	Literature	Orhan Pamuk
2005	Literature	Harold Pinter
2004	Literature	Elfriede Jelinek
1909	Medicine	Theodor Kocher
1908	Medicine	Paul Ehrlich
1908	Medicine	Ilya Mechnikov
1907	Medicine	Alphonse Laveran
1906	Medicine	Camillo Golgi
1906	Medicine	Santiago Ramón y Cajal
1905	Medicine	Robert Koch
1904	Medicine	Ivan Pavlov
1903	Medicine	Niels Ryberg Finsen
1902	Medicine	Ronald Ross
1901	Medicine	Emil von Behring
*/

-- Find all details of the prize won by PETER GRÜNBERG

SELECT * FROM nobel
WHERE winner LIKE 'Peter Grünberg'

/*
Correct answer
yr	subject	winner
2007	Physics	Peter Grünberg
*/

-- Find all details of the prize won by EUGENE O'NEILL

SELECT * FROM nobel
WHERE winner = 'Eugene O''Neill'

/*
Correct answer
yr	subject	winner
1936	Literature	Eugene O'Neill
*/

-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC

/*
Correct answer
winner	yr	subject
Sir Martin J. Evans	2007	Medicine
Sir Peter Mansfield	2003	Medicine
Sir Paul Nurse	2001	Medicine
Sir Harold Kroto	1996	Chemistry
Sir James W. Black	1988	Medicine
Sir Arthur Lewis	1979	Economics
Sir Nevill F. Mott	1977	Physics
Sir Bernard Katz	1970	Medicine
Sir John Eccles	1963	Medicine
Sir Frank Macfarlane Burnet	1960	Medicine
Sir Cyril Hinshelwood	1956	Chemistry
Sir Robert Robinson	1947	Chemistry
Sir Alexander Fleming	1945	Medicine
Sir Howard Florey	1945	Medicine
Sir Henry Dale	1936	Medicine
Sir Norman Angell	1933	Peace
Sir Charles Sherrington	1932	Medicine
Sir Venkata Raman	1930	Physics
Sir Frederick Hopkins	1929	Medicine
Sir Austen Chamberlain	1925	Peace
Sir William Ramsay	1904	Chemistry
*/

-- Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner
 
 /*
 Correct answer
winner	subject
Richard Stone	Economics
Jaroslav Seifert	Literature
César Milstein	Medicine
Georges J.F. Köhler	Medicine
Niels K. Jerne	Medicine
Desmond Tutu	Peace
Bruce Merrifield	Chemistry
Carlo Rubbia	Physics
Simon van der Meer	Physics
*/
-- 
