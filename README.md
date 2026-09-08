# LALIGA-TEAM-PERFORMANCE-ANALYSIS

## TABLE OF CONTENT

[PROJECT OVERVIEW](#project-overview)

[ANALYTICAL QUESTIONS](#analytical-questions)

[DATA SOURCE](#data-source)

[TOOLS AND PROCESSES](#tools-and-processes)

[VISUALIZATION](#visualization)

[Exploratory Data Analysis](#exploratory-data-analysis)

[KEY FINDINGS](#key-findings)

[RECOMMENDATIONS](#recommendations)

## PROJECT OVERVIEW

These work is to analyze which teams performed best in LALIGA 2025/2026 season, where the performed best and what factor contributed. These project involved creating an interactive team performance dashboard in power bi, after the data had gone through cleaning in excel and data manipulation in mysql.
The dashboard 5 KPIs : Goals scored, total yellow cards, total corners, sum of red cards, total matches played.
To analyze the team performance the dashboard will include charts showing average corners per match, over2.5 goals match count, average shot per match, sum of home goals and away goals by teams, goals scored vs goals conceded, Cleansheets.
The dashboard  will also include two slicers one to select the teams and the second to select the venue.

## ANALYTICAL QUESTIONS
1. who are the best performing teams
2. where are the positive areas that aid there performance

## DATA SOURCE
The data set for the analysis was gotten from https://football-data.co.uk

## TOOLS AND PROCESSES

Excel - cleaning of the data using power query,creating of two duplicate tables, fashioning them into two different tables home (carrying stats for all home teams)  and away (carrying stats for teams away), and appending of the table to get a workable csv file I uploaded to mysql

MYSQL - manipulated the appended table to give me separate queries that gives me the necessary insight

```
TEAM_TOTAL_GOALS =
select Team,sum(goals) as total_goals
FROM ts_academy.liiga2
group by Team
order by total_goals desc;
```

```
TEAM_TOTAL_GOALS_CONCEDED=

select Team,sum(`goals conceded`) as total_goals
FROM ts_academy.liiga2
group by Team
order by total_goals desc;
```

```
TEAM_TOTAL_CLEANSHEET

select Team,count(`goals conceded`) as clean_sheet
FROM ts_academy.liiga2
where `goals conceded` = 0
group by Team
order by count(`goals conceded`) desc;
```

```
To add a new column where two other columns summed=

Alter Table ts_academy.liiga2
ADD Total_goals int generated always AS (GOALS+`GOALS CONCEDED`) stored;
```

```
TEAM_OVER_2.5 goals MATCH =

select Team,count(goals)
FROM ts_academy.liiga2
where goals >= 3
group by Team
order by count(goals) DESC;
```

```
TEAM_AVG_GOAL_PER_GAME =

select Team,(count(goals)/38) AS AVG_GOAL_PER_MATCH
FROM ts_academy.liiga2
where goals >= 1
group by Team
order by count(goals) DESC;
```

```
home_and_away_goals =

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
```

```
total_yellow_card =

select Team,sum(yc)
FROM ts_academy.liiga2
group by team
order by sum(yc) desc;
```

```
total_red_card =

select Team,sum(rc)
FROM ts_academy.liiga2
group by team
order by sum(rc) desc;
```

```
corners =

select Team,sum(corners) as total_corners,sum(corners)/38 as average_corner_per_game
FROM ts_academy.liiga2
group by Team
order by total_corners desc;
```

```
shots_target =

select Team,sum(`shots on target`) as shots_on_target,sum(`shots on target`)/38 as average_shots_on_target_per_game
FROM ts_academy.liiga2
group by Team
order by shots_on_target desc;
```

POWER BI - uploaded the queries from mysql into power bi to different tables I used their primary key to create a relationship and create an interactive dashboard.

## VISUALIZATION
<img width="3296" height="1935" alt="IMG_20260908_080405" src="https://github.com/user-attachments/assets/30ef3e6e-a23e-4dbe-a24b-89dd666986b8" />


### Exploratory Data Analysis

The exploratory analysis focused on understanding the key performances of the teams especially the top ten teams. Key performance includes the total goals scored by each team to see their attacking strength and returns, total goals conceded to see their defensive strength, average corners per match also shows the attacking pressure each team has on the opposition  team, average shots per match shows the attacking efforts to achieve the goals. These findings help point out  the best performing teams and what they did in 2025/2026 season to get good results.

## KEY FINDINGS

The key findings are as follows:

1. All top ten teams had average corner per match, aside from REAL SOCIEDAD who finished 11th on the league table. REAL SOCIEDAD are 5th on the average corner per match chart and BARCELONA league winners no 1. average corner per match shows the attacking threat to oppositions during games.

2. League winners BARCELONA had the highest average shot on target in the league.

3. BARCELONA had the best defensive record with the highest clean sheets and fewer goals conceded  ratio.


## RECOMMENDATIONS 

1. Prioritize attacking efficiency
Teams should focus on improving their shot quality and conversion rate, as higher attacking output can create more goal-scoring opportunities and increase the chances of winning matches.

2.Maintain strong defensive organization
Teams should strengthen their defensive structure and work towards increasing clean sheets. Barcelona's defensive record shows that limiting goals conceded can be an important factor in achieving consistent results.

3.Improve attacking pressure through set pieces
Teams should work on creating more attacking opportunities, particularly through corners. A higher average number of corners can indicate sustained pressure on opponents and provide additional goal-scoring opportunities.

4.Use performance data to guide team strategy
Clubs should regularly monitor metrics such as shots, shots on target, goals scored, goals conceded, corners, and clean sheets to identify weaknesses and make data-driven tactical and player recruitment decisions.

