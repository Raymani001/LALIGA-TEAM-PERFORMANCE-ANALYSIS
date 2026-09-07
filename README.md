# LALIGA-TEAM-PERFORMANCE-ANALYSIS

##TABLE OF CONTENT

[PROJECT OVERVIEW](#project-overview)

[ANALYTICAL QUESTIONS](#analytical-questions)

[DATA SOURCE](#data-source)

[TOOLS AND PROCESSES](#tools-and-processes)

[VISUALIZATION](#visualization)

[Exploratory Data Analysis](#exploratory-data-analysis)

[KEY FINDINGS](#key-findings)

[RECOMMENDATIONS](#recommendations)

##PROJECT OVERVIEW

These work is to analyze which teams performed best in LALIGA 2025/2026 season, where the performed best and what factor contributed. These project involved creating an interactive team performance dashboard in power bi, after the data had gone through cleaning in excel and data manipulation in mysql.
The dashboard 5 KPIs : Goals scored, total yellow cards, total corners, sum of red cards, total matches played.
To analyze the team performance the dashboard will include charts showing average corners per match, over2.5 goals match count, average shot per match, sum of home goals and away goals by teams, goals scored vs goals conceded, Cleansheets.
The dashboard  will also include two slicers one to select the teams and the second to select the venue.

##ANALYTICAL QUESTIONS
1. who are the best performing teams
2. where are the positive areas that aid there performance

##DATA SOURCE
The data set for the analysis was gotten from https://football-data.co.uk

##TOOLS AND PROCESSES

Excel - cleaning of the data using power query,creating of two duplicate tables, fashioning them into two different tables home (carrying stats for all home teams)  and away (carrying stats for teams away), and appending of the table to get a workable csv file I uploaded to mysql

MYSQL - manipulated the appended table to give me separate queries that gives me the necessary insight

POWER BI - uploaded the queries from mysql into power bi to different tables I used their primary key to create a relationship and create an interactive dashboard.

##VISUALIZATION
<img width="1053" height="614" alt="uu" src="https://github.com/user-attachments/assets/b02c6231-4e9b-4357-8469-42a677890405" />

### Exploratory Data Analysis

The exploratory analysis focused on understanding the key performances of the teams especially the top ten teams. Key performance includes the total goals scored by each team to see their attacking strength and returns, total goals conceded to see their defensive strength, average corners per match also shows the attacking pressure each team has on the opposition  team, average shots per match shows the attacking efforts to achieve the goals. These findings help point out  the best performing teams and what they did in 2025/2026 season to get good results.

##KEY FINDINGS

The key findings are as follows:

1. All top ten teams had average corner per match, aside from REAL SOCIEDAD who finished 11th on the league table. REAL SOCIEDAD are 5th on the average corner per match chart and BARCELONA league winners no 1. average corner per match shows the attacking threat to oppositions during games.

2. League winners BARCELONA had the highest average shot on target in the league.

3. BARCELONA had the best defensive record with the highest clean sheets and fewer goals conceded  ratio.


##RECOMMENDATIONS 

1. Prioritize attacking efficiency
Teams should focus on improving their shot quality and conversion rate, as higher attacking output can create more goal-scoring opportunities and increase the chances of winning matches.

2.Maintain strong defensive organization
Teams should strengthen their defensive structure and work towards increasing clean sheets. Barcelona's defensive record shows that limiting goals conceded can be an important factor in achieving consistent results.

3.Improve attacking pressure through set pieces
Teams should work on creating more attacking opportunities, particularly through corners. A higher average number of corners can indicate sustained pressure on opponents and provide additional goal-scoring opportunities.

4.Use performance data to guide team strategy
Clubs should regularly monitor metrics such as shots, shots on target, goals scored, goals conceded, corners, and clean sheets to identify weaknesses and make data-driven tactical and player recruitment decisions.

