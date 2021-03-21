-- Create tables for raw data to be loaded into
CREATE TABLE  regions(
id SERIAL PRIMARY KEY,    
noc TEXT,
region TEXT,
notes TEXT
);

CREATE TABLE  teams(
id SERIAL PRIMARY KEY,
athlete_id INT,
team TEXT
);

CREATE TABLE  athlete (
id SERIAL PRIMARY KEY,
athlete_id INT,
name TEXT,
sex TEXT
);

CREATE TABLE  athlete_data(
id SERIAL PRIMARY KEY,
athlete_id INT,
year INT,
sex TEXT,
age float,
height float,
weight float,
team TEXT
);

CREATE TABLE  sport(
id SERIAL PRIMARY KEY,
athlete_id INT,
sport TEXT,
event TEXT
);

CREATE TABLE  medals(
id SERIAL PRIMARY KEY,    
athlete_id INT,
year INT,
medal TEXT,
event TEXT
);

CREATE TABLE  games(
id SERIAL PRIMARY KEY, 
year INT,
noc TEXT,
games TEXT,
season TEXT,
city TEXT
);

CREATE TABLE  venues(
id SERIAL PRIMARY KEY, 
city TEXT,
country TEXT,
year TEXT,
continent TEXT,
opening_ceremony TEXT,
closing_ceremony TEXT
);

SELECT * FROM venues

SELECT * FROM athlete

SELECT * FROM athlete_data

SELECT * FROM games

SELECT * FROM medals

SELECT * FROM regions

SELECT * FROM sport

SELECT * FROM teams

SELECT COUNT(athlete.name), athlete.name
FROM athlete
INNER JOIN medals ON
athlete.athlete_id = medals.athlete_id
WHERE medals.medal = 'Gold' AND athlete.sex = 'F'
GROUP BY athlete.name 
ORDER BY athlete.count DESC;

SELECT COUNT(medals.event), medals.event
FROM medals
WHERE medals.medal = 'Gold' 
GROUP BY medals.event 
ORDER BY medals.count DESC;