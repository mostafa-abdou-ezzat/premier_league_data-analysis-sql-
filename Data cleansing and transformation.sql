                                                                                  --in case i need to re-run the query--

if exists 

(select* from premier_league.dbo.offensive_play)

drop table premier_league.dbo.offensive_play





                                                               --creating a table showing the numbers of red and yellow cards over the years-- 




create table premier_league.dbo.offensive_play
(team nvarchar(20) , total_yel_card float, total_red_card float, season nvarchar(20))

-- to avoid this error (String or binary data would be truncated in table 'premier_league.dbo.offensive_play', column 'team'. Truncated value: 'C'.) used set ansi_warning off
SET ANSI_WARNINGS OFF;
insert into premier_league.dbo.offensive_play
(team, total_yel_card, total_red_card, season)
select
trim(team) as team,
total_yel_card,
total_red_card,
season
from
premier_league.dbo.stats
SET ANSI_WARNINGS ON;



                                                                                         --renamed the table --

sp_rename 'offensive_play', 'total_cards'





                                                                                  --creating second table (performance)--



use premier_league
create table performance
(team nvarchar(20), goals float, ontarget_scoring_att float, goal_fastbreak float, total_pass float, total_through_ball float, total_long_balls float, total_cross float, corner_taken float, touches float, season nvarchar(20))

SET ANSI_WARNINGS OFF;
insert into performance
select
trim(team) as team,
goals,
ontarget_scoring_att,
goal_fastbreak,
total_pass,
total_through_ball,
total_long_balls,total_cross,
corner_taken,
touches,
season
from stats
SET ANSI_WARNINGS ON;





                                                                                --creating defending performance table--



use premier_league
create table defending_performance
(team nvarchar(20), clean_sheet float, goals_conceded float, saves float, interception float, total_tackle float, total_clearance float, own_goals float, penalty_conceded float, clearance_off_line float, penalty_save float, season nvarchar(20))

SET ANSI_WARNINGS OFF;
insert into defending_performance
select
trim(team) as team,
clean_sheet,
goals_conceded,
saves,
interception,
total_tackle,
total_clearance,
own_goals,
penalty_conceded,
clearance_off_line,
penalty_save,
season
from stats
SET ANSI_WARNINGS ON;






                                                                              --creating(premier league trends) table--




create table premier_league_trends
(total_offside float, att_freekick_goal float, total_yel_card float, total_red_card float, season nvarchar(20))

insert into premier_league_trends
select
total_offside,
att_freekick_goal,
total_yel_card,
total_yel_card,
season
from stats




