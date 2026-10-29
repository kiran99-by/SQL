create database sql_ipl_analysis;
use sql_ipl_analysis;

CREATE TABLE teams (
		team_id INT PRIMARY KEY,
		team_name VARCHAR(50),
    captain VARCHAR(50),
    home_city VARCHAR(50)
);

INSERT INTO teams VALUES
(1,'Mumbai Indians','Hardik Pandya','Mumbai'),
(2,'Chennai Super Kings','Ruturaj Gaikwad','Chennai'),
(3,'RCB','Faf du Plessis','Bangalore'),
(4,'KKR','Shreyas Iyer','Kolkata'),
(5,'Delhi Capitals','Rishabh Pant','Delhi'),
(6,'Rajasthan Royals','Sanju Samson','Jaipur'),
(7,'Sunrisers Hyderabad','Pat Cummins','Hyderabad'),
(8,'Punjab Kings','Shikhar Dhawan','Mohali'),
(9,'Lucknow Super Giants','KL Rahul','Lucknow'),
(10,'Gujarat Titans','Shubman Gill','Ahmedabad'),
(11,'Deccan Chargers','Adam Gilchrist','Hyderabad'),
(12,'Pune Warriors','Yuvraj Singh','Pune'),
(13,'Gujarat Lions','Suresh Raina','Rajkot'),
(14,'Kochi Tuskers Kerala','Mahela Jayawardene','Kochi'),
(15,'Rising Pune Supergiants','Steve Smith','Pune');

CREATE TABLE players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(50),
    role VARCHAR(30),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

INSERT INTO players VALUES
(101,'Rohit Sharma','Batsman',1),
(102,'MS Dhoni','Wicket Keeper',2),
(103,'Virat Kohli','Batsman',3),
(104,'Andre Russell','All Rounder',4),
(105,'Rishabh Pant','Wicket Keeper',5),
(106,'Sanju Samson','Wicket Keeper',6),
(107,'Pat Cummins','Bowler',7),
(108,'Shikhar Dhawan','Batsman',8),
(109,'KL Rahul','Batsman',9),
(110,'Shubman Gill','Batsman',10),
(111,'Adam Gilchrist','Wicket Keeper',11),
(112,'Yuvraj Singh','All Rounder',12),
(113,'Suresh Raina','Batsman',13),
(114,'Mahela Jayawardene','Batsman',14),
(115,'Steve Smith','Batsman',15);

CREATE TABLE venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO venues VALUES
(1,'Wankhede Stadium','Mumbai'),
(2,'Chepauk Stadium','Chennai'),
(3,'Chinnaswamy Stadium','Bangalore'),
(4,'Eden Gardens','Kolkata'),
(5,'Arun Jaitley Stadium','Delhi'),
(6,'Sawai Mansingh Stadium','Jaipur'),
(7,'Rajiv Gandhi Stadium','Hyderabad'),
(8,'Mohali Stadium','Mohali'),
(9,'Ekana Stadium','Lucknow'),
(10,'Narendra Modi Stadium','Ahmedabad'),
(11,'DY Patil Stadium','Navi Mumbai'),
(12,'Brabourne Stadium','Mumbai'),
(13,'Green Park Stadium','Kanpur'),
(14,'Holkar Stadium','Indore'),
(15,'Barsapara Stadium','Guwahati');

CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    match_date DATE,
    team1_id INT,
    team2_id INT,
    winner_team_id INT,
    venue_id INT,

    FOREIGN KEY (team1_id) REFERENCES teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES teams(team_id),
    FOREIGN KEY (winner_team_id) REFERENCES teams(team_id),
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

INSERT INTO matches VALUES
(1,'2024-03-22',1,2,2,1),
(2,'2024-03-23',3,4,3,3),
(3,'2024-03-24',5,6,6,5),
(4,'2024-03-25',7,8,7,7),
(5,'2024-03-26',9,10,10,9),
(6,'2024-03-27',1,3,1,12),
(7,'2024-03-28',2,4,2,2),
(8,'2024-03-29',5,7,7,5),
(9,'2024-03-30',6,8,6,6),
(10,'2024-03-31',9,1,1,9),
(11,'2024-04-01',10,2,10,10),
(12,'2024-04-02',3,5,3,3),
(13,'2024-04-03',4,6,4,4),
(14,'2024-04-04',7,9,9,7),
(15,'2024-04-05',8,10,10,8);

CREATE TABLE player_stats (
    stat_id INT PRIMARY KEY,
    match_id INT,
    player_id INT,
    runs INT,
    wickets INT,


    FOREIGN KEY (match_id) REFERENCES matches(match_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);

INSERT INTO player_stats VALUES
(1,1,102,45,0),
(2,2,103,88,0),
(3,3,106,67,0),
(4,4,107,15,3),
(5,5,110,92,0),
(6,6,101,75,0),
(7,7,102,55,0),
(8,8,107,20,4),
(9,9,106,81,0),
(10,10,101,64,0),
(11,11,110,99,0),
(12,12,103,72,0),
(13,13,104,40,2),
(14,14,109,85,0),
(15,15,110,58,0);
 
 -- A. Basic Level Questions
 
 -- Q1. show all PLAYERS
 SELECT * FROM players;
 
-- Q2. Show all teams
select * from teams;

-- Q3.SHOWE ALL MATCHES
select * from matches;
 
 -- ( JOIN QURIS)
-- Total Matches Played
 SELECT COUNT(*) AS total_matches
FROM matches;

-- Q5. Match winners with venue
SELECT m.match_id,
t.team_name AS winner,
v.venue_name
FROM matches m
JOIN teams t
ON m.winner_team_id = t.team_id
JOIN venues v
ON m.venue_id = v.venue_id;

-- (Aggregate Function Queries)
-- Q6. Total matches played
SELECT COUNT(*) AS total_matches
FROM matches;


-- Q7. Total runs scored by each player
SELECT p.player_name,
       SUM(ps.runs) AS total_runs
FROM player_stats ps
JOIN players p
ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_runs DESC;

-- Q9. Total wickets by each player
SELECT p.player_name,
SUM(ps.wickets) AS total_wickets
FROM player_stats ps
JOIN players p
ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_wickets DESC;

-- (Top Performance Queries)
-- Q10. Highest run scorer
SELECT p.player_name,
SUM(ps.runs) AS total_runs
FROM player_stats ps
JOIN players p
ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_runs DESC
LIMIT 1;

-- Q11. Highest wicket taker
SELECT p.player_name,
SUM(ps.wickets) AS total_wickets
FROM player_stats ps
JOIN players p
ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_wickets DESC
LIMIT 1;

-- Q12. Top 3 batsmen
SELECT p.player_name,
SUM(ps.runs) AS total_runs
FROM player_stats ps
JOIN players p
ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_runs DESC
LIMIT 3; 

-- Conditional Queries --
-- Q13.Players who scored more than 70 runs
SELECT p.player_name,
ps.runs
FROM player_stats ps
JOIN players p
ON ps.player_id = p.player_id
WHERE ps.runs > 70;




SELECT e. employee_id ,student_id
FROM employee_id
 left JOIN  employees
on e.eployee_id =e.employees
WHERE company_id;










