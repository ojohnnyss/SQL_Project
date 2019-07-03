-- How many stops are in the database.

SELECT COUNT(stops.id) FROM stops;

/*
Correct answer
COUNT(stops.i..
246
*/

-- Find the id value for the stop 'Craiglockhart'

SELECT stops.id FROM stops WHERE stops.name='Craiglockhart'

/*
Correct answer
id
53
*/

-- Give the id and the name for the stops on the '4' 'LRT' service.

SELECT stops.id, stops.name
FROM stops INNER JOIN route ON stops.id=route.stop
WHERE route.num='4' AND route.company='LRT'

/*
Correct answer
id	name
19	Bingham
177	Northfield
149	London Road
194	Princes Street
115	Haymarket
53	Craiglockhart
179	Oxgangs
85	Fairmilehead
117	Hillend
*/

-- The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53).
-- Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) != 1

/*
Correct answer
company	num	COUNT(*)
LRT	4	2
LRT	45	2
*/

-- Change the query so that it shows the services from Craiglockhart to London Road.

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149

/*
Correct answer
company	num	stop	stop
LRT	4	53	149
LRT	45	53	149
*/

-- Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

/*
Correct answer
company	num	name	name
LRT	4	Craiglockhart	London Road
LRT	45	Craiglockhart	London Road
*/

-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith'
GROUP BY a.company, a.num

/*
Correct answer
company	num
LRT	12
LRT	2
LRT	22
LRT	25
LRT	2A
SMT	C5
*/

-- Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'

/*
Correct answer
company	num
LRT	10
LRT	27
LRT	45
LRT	47
*/

-- Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company.
-- Include the company and bus no. of the relevant services.

SELECT DISTINCT stopb.name, a.company, a.num FROM route a
  JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Craiglockhart'
  
  /*
  Correct answer
name	company	num
Silverknowes	LRT	10
Muirhouse	LRT	10
Newhaven	LRT	10
Leith	LRT	10
Leith Walk	LRT	10
Princes Street	LRT	10
Tollcross	LRT	10
Craiglockhart	LRT	10
Colinton	LRT	10
Torphin	LRT	10
Silverknowes	LRT	27
Crewe Toll	LRT	27
Canonmills	LRT	27
Hanover Street	LRT	27
Tollcross	LRT	27
Craiglockhart	LRT	27
Oxgangs	LRT	27
Hunters Tryst	LRT	27
Bingham	LRT	4
Northfield	LRT	4
London Road	LRT	4
Princes Street	LRT	4
Haymarket	LRT	4
Craiglockhart	LRT	4
Oxgangs	LRT	4
Fairmilehead	LRT	4
Hillend	LRT	4
Brunstane	LRT	45
Duddingston	LRT	45
Northfield	LRT	45
London Road	LRT	45
Hanover Street	LRT	45
Tollcross	LRT	45
Craiglockhart	LRT	45
Colinton	LRT	45
Currie	LRT	45
Riccarton Campus	LRT	45
Canonmills	LRT	47
Hanover Street	LRT	47
Tollcross	LRT	47
Craiglockhart	LRT	47
Colinton	LRT	47
Currie	LRT	47
Balerno	LRT	47
Cockburn Crescent	LRT	47
Balerno Church	LRT	47
*/

-- Find the routes involving two buses that can go from Craiglockhart to Lochend.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer, and the bus no. and company for the second bus.

SELECT from_c.num, from_c.company, from_c.name, to_l.num, to_l.company FROM (SELECT DISTINCT stopd.name, c.company, c.num FROM route c
  JOIN route d ON (c.company=d.company AND c.num=d.num)
  JOIN stops stopc ON (c.stop=stopc.id)
  JOIN stops stopd ON (d.stop=stopd.id)
  WHERE stopc.name='Craiglockhart') AS from_c
JOIN (SELECT * FROM (SELECT DISTINCT stopb.name, a.company, a.num FROM route a
  JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Lochend') AS from_ca) to_l ON (from_c.name=to_l.name);
  
  /*
  Correct answer
num	company	name	num	company
10	LRT	Leith	C5	SMT
10	LRT	Leith	87	LRT
10	LRT	Leith	35	LRT
10	LRT	Leith	34	LRT
10	LRT	Princes Street	C5	SMT
10	LRT	Princes Street	65	LRT
27	LRT	Crewe Toll	20	LRT
27	LRT	Canonmills	35	LRT
27	LRT	Canonmills	34	LRT
4	LRT	London Road	C5	SMT
4	LRT	London Road	87A	LRT
4	LRT	London Road	87	LRT
4	LRT	London Road	65	LRT
4	LRT	London Road	46A	LRT
4	LRT	London Road	42	LRT
4	LRT	London Road	35	LRT
4	LRT	London Road	34	LRT
4	LRT	London Road	20	LRT
4	LRT	Princes Street	C5	SMT
4	LRT	Princes Street	65	LRT
4	LRT	Haymarket	C5	SMT
4	LRT	Haymarket	65	LRT
45	LRT	Duddingston	46A	LRT
45	LRT	Duddingston	42	LRT
45	LRT	London Road	C5	SMT
45	LRT	London Road	87A	LRT
45	LRT	London Road	87	LRT
45	LRT	London Road	65	LRT
45	LRT	London Road	46A	LRT
45	LRT	London Road	42	LRT
45	LRT	London Road	35	LRT
45	LRT	London Road	34	LRT
45	LRT	London Road	20	LRT
45	LRT	Riccarton Campus	65	LRT
47	LRT	Canonmills	35	LRT
47	LRT	Canonmills	34	LRT
*/
