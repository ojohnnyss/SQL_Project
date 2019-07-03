-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

SELECT matchid, player FROM goal
WHERE teamid = 'GER'

/*
Correct answer
matchid	player
1008	Mario Gómez
1010	Mario Gómez
1010	Mario Gómez
1012	Lukas Podolski
1012	Lars Bender
1026	Philipp Lahm
1026	Sami Khedira
1026	Miroslav Klose
1026	Marco Reus
1030	Mesut Özil
*/

-- Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012
  
/*
Correct answer
id	stadium	team1	team2
1012	Arena Lviv	DEN	GER
*/

-- Modify it to show the player, teamid, stadium and mdate for every German goal.

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'
  
 /*
 Correct answer
player	teamid	stadium	mdate
Mario Gómez	GER	Arena Lviv	9 June 2012
Mario Gómez	GER	Metalist Stadium	13 June 2012
Mario Gómez	GER	Metalist Stadium	13 June 2012
Lukas Podolski	GER	Arena Lviv	17 June 2012
Lars Bender	GER	Arena Lviv	17 June 2012
Philipp Lahm	GER	PGE Arena Gdansk	22 June 2012
Sami Khedira	GER	PGE Arena Gdansk	22 June 2012
Miroslav Klose	GER	PGE Arena Gdansk	22 June 2012
Marco Reus	GER	PGE Arena Gdansk	22 June 2012
Mesut Özil	GER	National Stadium, Warsaw	28 June 2012
*/

-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT team1, team2, player
FROM game INNER JOIN goal ON (game.id=goal.matchid)
WHERE player LIKE 'Mario%'

/*
Correct answer
team1	team2	player
GER	POR	Mario Gómez
NED	GER	Mario Gómez
NED	GER	Mario Gómez
IRL	CRO	Mario Mandžukic
IRL	CRO	Mario Mandžukic
ITA	CRO	Mario Mandžukic
ITA	IRL	Mario Balotelli
GER	ITA	Mario Balotelli
GER	ITA	Mario Balotelli
*/

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT player, teamid, coach, gtime
  FROM goal INNER JOIN eteam ON teamid=id
 WHERE gtime<=10
 
 /*
 Correct answer
player	teamid	coach	gtime
Petr Jirácek	CZE	Michal Bílek	3
Václav Pilar	CZE	Michal Bílek	6
Mario Mandžukic	CRO	Slaven Bilic	3
Fernando Torres	ESP	Vicente del Bosque	4
*/

-- List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT game.mdate, eteam.teamname FROM eteam
INNER JOIN game ON (eteam.id=game.team1) WHERE eteam.coach = 'Fernando Santos'

/*
Correct answer
mdate	teamname
12 June 2012	Greece
16 June 2012	Greece
*/

-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT goal.player FROM goal
INNER JOIN game ON (goal.matchid=game.id) WHERE game.stadium = 'National Stadium, Warsaw'

/*
Correct answer
player
Robert Lewandowski
Dimitris Salpingidis
Alan Dzagoev
Jakub Blaszczykowski
Giorgos Karagounis
Cristiano Ronaldo
Mario Balotelli
Mario Balotelli
Mesut Özil
*/

-- Instead show the name of all players who scored a goal against Germany.

SELECT DISTINCT player FROM game
JOIN goal ON matchid = id 
WHERE (team1='GER' OR team2='GER') AND teamid != 'GER'

/*
Correct answer
player
Robin van Persie
Michael Krohn-Dehli
Georgios Samaras
Dimitris Salpingidis
Mario Balotelli
*/

-- Show teamname and the total number of goals scored.

SELECT teamname, COUNT(goal.teamid)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

/*
Correct answer
teamname	COUNT(goal.te..
Croatia	4
Czech Republic	4
Denmark	4
England	5
France	3
Germany	10
Greece	5
Italy	6
Netherlands	2
Poland	2
Portugal	6
Republic of Ireland	1
Russia	5
Spain	12
Sweden	5
Ukraine	2
*/

-- Show the stadium and the number of goals scored in each stadium.

SELECT game.stadium, COUNT(game.stadium) FROM game
INNER JOIN goal ON (game.id=goal.matchid) GROUP BY game.stadium

/*
Correct answer
stadium	COUNT(game.st..
Arena Lviv	9
Donbass Arena	7
Metalist Stadium	7
National Stadium, Warsaw	9
Olimpiyskiy National Sports Complex	14
PGE Arena Gdansk	13
Stadion Miejski (Poznan)	8
Stadion Miejski (Wroclaw)	9
*/

-- For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT goal.matchid, game.mdate, COUNT(goal.matchid)
  FROM goal JOIN game ON goal.matchid = game.id 
 WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY goal.matchid, game.mdate
 
 /*
 Correct answer
matchid	mdate	COUNT(goal.ma..
1001	8 June 2012	2
1004	12 June 2012	2
1005	16 June 2012	1
*/

-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT goal.matchid, game.mdate, COUNT(goal.matchid)
FROM goal INNER JOIN game ON goal.matchid=game.id
WHERE goal.teamid = 'GER' GROUP BY goal.matchid, game.mdate

/*
Correct answer
matchid	mdate	COUNT(goal.ma..
1008	9 June 2012	1
1010	13 June 2012	2
1012	17 June 2012	2
1026	22 June 2012	4
1030	28 June 2012	1
*/

-- Sort your result by mdate, matchid, team1 and team2.

SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2

/*
Correct answer
mdate	team1	score1	team2	score2
1 July 2012	ESP	4	ITA	0
10 June 2012	ESP	1	ITA	1
10 June 2012	IRL	1	CRO	3
11 June 2012	FRA	1	ENG	1
11 June 2012	UKR	2	SWE	1
12 June 2012	GRE	1	CZE	2
12 June 2012	POL	1	RUS	1
13 June 2012	DEN	2	POR	3
13 June 2012	NED	1	GER	2
14 June 2012	ITA	1	CRO	1
14 June 2012	ESP	4	IRL	0
15 June 2012	UKR	0	FRA	2
15 June 2012	SWE	2	ENG	3
16 June 2012	CZE	1	POL	0
16 June 2012	GRE	1	RUS	0
17 June 2012	POR	2	NED	1
17 June 2012	DEN	1	GER	2
18 June 2012	CRO	0	ESP	1
18 June 2012	ITA	2	IRL	0
19 June 2012	ENG	1	UKR	0
19 June 2012	SWE	2	FRA	0
21 June 2012	CZE	0	POR	1
22 June 2012	GER	4	GRE	2
23 June 2012	ESP	2	FRA	0
24 June 2012	ENG	0	ITA	0
27 June 2012	POR	0	ESP	0
28 June 2012	GER	1	ITA	2
8 June 2012	POL	1	GRE	1
8 June 2012	RUS	4	CZE	1
9 June 2012	NED	0	DEN	1
9 June 2012	GER	1	POR	0
*/
