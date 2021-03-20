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
team TEXT,
noc TEXT
);

CREATE TABLE  athletes(
id SERIAL PRIMARY KEY,
athlete_id INT,
name TEXT,
sex TEXT,
age float,
height float,
weight float
);

CREATE TABLE  sport(
id SERIAL PRIMARY KEY,
athlete_id INT,
sport TEXT
);

CREATE TABLE  medals(
id SERIAL PRIMARY KEY,    
athlete_id INT,
medal TEXT,
event TEXT
);

CREATE TABLE  games(
id SERIAL PRIMARY KEY, 
noc TEXT,
games TEXT,
year TEXT,
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

SELECT * FROM athletes

SELECT * FROM games

SELECT * FROM medals

SELECT * FROM regions

SELECT * FROM sport

SELECT * FROM teams

SELECT COUNT(athletes.name), athletes.name
FROM athletes
INNER JOIN medals ON
athletes.athlete_id = medals.athlete_id
WHERE medals.medal = 'Gold' AND athletes.sex = 'F'
GROUP BY athletes.name
ORDER BY athletes.count DESC;