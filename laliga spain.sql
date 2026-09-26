select *
FROM ts_academy.liiga2;

CREATE VIEW TEAM_TOTAL_GOALS AS
select Team,sum(goals) as total_goals
FROM ts_academy.liiga2
group by Team
order by total_goals desc;

CREATE VIEW TEAM_TOTAL_GOALS_CONCEDED AS
select Team,sum(`goals conceded`) as total_goals
FROM ts_academy.liiga2
group by Team
order by total_goals desc;

CREATE VIEW TEAM_TOTAL_CLEANSHEET AS
select Team,count(`goals conceded`) as clean_sheet
FROM ts_academy.liiga2
where `goals conceded` = 0
group by Team
order by count(`goals conceded`) desc;


Alter Table ts_academy.liiga2
ADD Total_goals int generated always AS (GOALS+`GOALS CONCEDED`) stored;

Alter Table ts_academy.liiga2
DROP column `Total_goal`;

CREATE VIEW TEAM_OVER_3_MATCH AS
select Team,count(goals)
FROM ts_academy.liiga2
where goals >= 3
group by Team
order by count(goals) DESC;

CREATE VIEW TEAM_OVER_3_MATCH_PERCENTAGE AS
select Team,(count(goals)/38)*100
FROM ts_academy.liiga2
where goals >= 3
group by Team
order by count(goals) DESC; 

CREATE VIEW TEAM_BTTS_PERCENTAGE AS
select Team,count(goals AND `GOALS CONCEDED`)
FROM ts_academy.liiga2
where goals >= 1
AND `GOALS CONCEDED` >= 1
group by Team
order by count(goals) DESC;

CREATE VIEW TEAM_AVG_GOAL_PER_GAME  AS
select Team,(count(goals)/38) AS AVG_GOAL_PER_MATCH
FROM ts_academy.liiga2
where goals >= 1
group by Team
order by count(goals) DESC;

create view home_and_away_goals as
select home_stat.Team,home_goals,away_goal
from
(select Team, sum(goals) as home_goals
FROM ts_academy.liiga2
where venue = 'home'
group by team) as home_stat
join
(select Team, sum(goals) as away_goal
FROM ts_academy.liiga2
where venue = 'away'
group by team) as away_stat
on
home_stat.Team = away_stat.Team ;

create view total_yellow_card as
select Team,sum(yc)
FROM ts_academy.liiga2
group by team
order by sum(yc) desc;

create view total_red_card as
select Team,sum(rc)
FROM ts_academy.liiga2
group by team
order by sum(rc) desc;

create view corners as
select Team,sum(corners) as total_corners,sum(corners)/38 as average_corner_per_game
FROM ts_academy.liiga2
group by Team
order by total_corners desc;

create view shots_target as
select Team,sum(`shots on target`) as shots_on_target,sum(`shots on target`)/38 as average_shots_on_target_per_game
FROM ts_academy.liiga2
group by Team
order by shots_on_target desc;