import excel "/Users/nguyenquynhnhu/Desktop/Advanced Data Analysis /ADA-ClassSurvey.xlsx", sheet("Advanced Data Analysis-Class Su") firstrow

rename Genderofrespondent Gender

rename Ageofrespondentyears Age

rename HaveyoualreadydoneStatistics StatisticsExam

rename HaveyouattendedtheStatistics StatisticsCourse

rename statisticsisveryhelpfuldisci helpful

rename statisticsisverydifficultsub difficult

rename knowledgeofstatisticsisvery important

save "/Users/nguyenquynhnhu/Desktop/Advanced Data Analysis /ADA-ClassSurvey.dta"
file /Users/nguyenquynhnhu/Desktop/Advanced Data Analysis /ADA-ClassSurvey.dta saved

tab Gender

sum Age

summarize Age, detail

graph box Age

tab STATA

tab StatisticsCourse

graph bar (count), over(StatisticsExam)

graph pie, over(StatisticsCourse)

histogram Score
(bin=5, start=10, width=4.4)

histogram Score, width(1) addlabel
(bin=22, start=10, width=1)

tab important helpful

tab important

tab helpful

tab difficult

tabulate StatisticsCourse, summarize(Score)

sum Q18score

tab Q18score

generate Q18new = substr(Q18score,1,1)

destring Q18new, generate(Q18value)
Q18new: all characters numeric; Q18value generated as byte

drop Q18new

proportion Q18value

tab Q18score Q17score

save "/Users/nguyenquynhnhu/Desktop/Advanced Data Analysis /ADA-ClassSurvey.dta", replace
file /Users/nguyenquynhnhu/Desktop/Advanced Data Analysis /ADA-ClassSurvey.dta saved
preserve

keep if Gender=="Male"
(17 observations deleted)

tab important

histogram Score
(bin=2, start=16, width=8)

sum Score, detail

tabulate StatisticsCourse, summarize(Score)

restore

log close
