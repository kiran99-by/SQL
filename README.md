# SQL
IPL Analysis Using SQL
A data-driven exploration of Indian Premier League (IPL) match patterns, player performance, and venue insights using SQL.

Project by: Kiran Mirje
Project Overview
The Indian Premier League generates large amounts of match and player data each season. This project uses a relational database and SQL queries to explore match records and player performance. The goal is to organize the data and make it easier to investigate team, player, and venue-related patterns.
Objectives
- Analyze IPL match records.
- Explore player performance through runs and wickets.
- Identify match winners and the venues where matches were played.
- Practice SQL joins, aggregate functions, grouping, sorting, and limiting results.
- Build a foundation for deeper analysis of IPL trends.
Database Architecture
The project presentation describes five core entities:
Table	Purpose
matches	Core match records
players	Player master data
teams	Franchise details
venues	Ground information
player_stats	Player performance metrics


These entities are connected through relational keys so queries can combine match, team, venue, and player information.
SQL Analysis
1. Total Matches
Counts the match records in the matches table.
SELECT COUNT(*) AS total_matches
FROM matches;
2. Match Winners with Venue
Joins matches, teams, and venues to show each match ID, winning team, and venue.
SELECT
    m.match_id,
    t.team_name AS winner,
    v.venue_name
FROM matches m
JOIN teams t
    ON m.winner_team_id = t.team_id
JOIN venues v
    ON m.venue_id = v.venue_id;
3. Total Player Records
Note: The presentation labels this as “Total Players,” but the SQL shown counts rows in matches. The query below preserves the SQL shown in the presentation.

SELECT COUNT(*) AS total_matches
FROM matches;
To count player records instead, use:
SELECT COUNT(*) AS total_players
FROM players;
4. Total Runs per Player
Adds each player's runs and sorts the results from highest to lowest.
SELECT
    p.player_name,
    SUM(ps.runs) AS total_runs
FROM player_stats ps
JOIN players p
    ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_runs DESC;
5. Total Wickets per Player
Adds each player's recorded wickets and sorts the results in descending order.
SELECT
    p.player_name,
    SUM(ps.wickets) AS total_wickets
FROM player_stats ps
JOIN players p
    ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_wickets DESC;
6. Highest Run-Scorer
Ranks players by total runs. The first row represents the highest total in the data.
SELECT
    p.player_name,
    SUM(ps.runs) AS total_runs
FROM player_stats ps
JOIN players p
    ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_runs DESC;
7. Highest Wicket-Taker
Returns the player with the highest total wickets.
SELECT
    p.player_name,
    SUM(ps.wickets) AS total_wickets
FROM player_stats ps
JOIN players p
    ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_wickets DESC
LIMIT 1;
8. Top 3 Batsmen
Returns the three players with the highest total runs.
SELECT
    p.player_name,
    SUM(ps.runs) AS total_runs
FROM player_stats ps
JOIN players p
    ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_runs DESC
LIMIT 3;
SQL Concepts Used
- SELECT and COUNT()
- Aggregate functions such as SUM()
- JOIN
- GROUP BY
- ORDER BY
- LIMIT
- Table aliases
Key Takeaways and Future Scope
The presentation identifies these potential uses of the analysis:
- Enhanced decision-making: support team composition and match planning.
- Player scouting: compare performance and explore player value.
- Fan engagement: support richer statistics and match narratives.
Possible future improvements include:
- Analyze toss decisions and their relationship with match outcomes.
- Compare team performance across seasons.
- Explore venue-wise and season-wise trends.
- Add charts or a dashboard to communicate findings.
- Explore predictive modeling for match outcomes.
These are proposed extensions; the presentation does not include measured results for them.
Project Files
The current project presentation is IPL-Analysis modified.pptx. Add your SQL script and, if available, the dataset or database setup files to this repository so others can reproduce the analysis.

Suggested repository structure:
IPL-Analysis/
├── README.md
├── IPL-Analysis modified.pptx
├── sql/
│   └── ipl_analysis.sql
└── data/
    └── (add dataset files if you are permitted to share them)
How to Run
1. Create a database in a SQL database system that supports the syntax used in the queries.
2. Create and populate the five tables: matches, players, teams, venues, and player_stats.
3. Save the queries in a .sql file.
4. Run each query in your SQL client.
5. Check the returned records and totals against your dataset.
Important: The presentation does not specify the SQL database system, full table definitions, dataset source, or actual query results. Add those details to the repository when available.
Author
Kiran Mirje
SQL | Data Analysis | IPL Statistics
