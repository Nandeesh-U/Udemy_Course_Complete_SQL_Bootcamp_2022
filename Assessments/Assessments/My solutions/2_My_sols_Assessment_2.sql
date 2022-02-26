-- ASSESSMENT 2
-- 1)
SELECT * FROM cd.facilities;

--2)
SELECT name,membercost
FROM cd.facilities;

--3)
SELECT name
FROM cd.facilities
WHERE membercost>0;

--4)
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost>0 AND
membercost<monthlymaintenance/50;

--5)
SELECT name
FROM cd.facilities
WHERE name LIKE '%Tennis%';

--6)
SELECT name
FROM cd.facilities
WHERE facid IN (1,5);

--7)
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

--8)
SELECT DISTINCT(surname)
FROM cd.members
ORDER BY surname
LIMIT 10;

--9)
SELECT joindate
FROM cd.members
WHERE joindate = (SELECT MAX(joindate) FROM cd.members);

--10)
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost>=10;

--11)
SELECT facid, SUM(slots)
FROM cd.bookings
WHERE starttime BETWEEN '2012-09-01' AND '2012-09-30 23:59:59'
GROUP BY facid;

--12)
SELECT facid, SUM(slots)
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots)>1000;

--13)
SELECT starttime, name
FROM cd.bookings
INNER JOIN cd.facilities
ON cd.facilities.facid = cd.bookings.facid
WHERE starttime >= '2012-09-21' AND starttime<'2012-09-22' AND name LIKE '%Tennis Court%'
ORDER BY starttime;

--14)
SELECT cd.bookings.memid, surname, firstname, starttime
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE firstname = 'David' AND surname = 'Farrell';