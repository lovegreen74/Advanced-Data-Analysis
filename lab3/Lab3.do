*** LAB 3 ***

*Set working directory
*Start a log file


cd "/Users/silviasalini/Google Drive/Advanced Data Analysis IPLE/Lab3"
log using Lab3, replace
cmdlog using Lab3, replace

*Dataset: Employee data.dat
use "Employee data.dta", clear

gen year=year( bdate )
gen age=2016 - year
label variable age "Age of respondent"
drop year

*1.	Check if the job category influences the average salary, both with an appropriate test and graphically
graph box salary, over(jobcat)
ciplot salary, by(jobcat)
* ttest salary, by(jobcat)
* error
table jobcat, contents(freq mean salary sd salary)
*by jobcat, sort : ci mean salary
oneway salary jobcat, tabulate
* you can also use anova, but this produce a model 
anova salary jobcat

*2.Check if the jobcat and the gender are associated
tab gender jobcat
tab gender jobcat, row
tab gender jobcat, col
*finit tabplot
tabplot gender jobcat, percent(gender)
tabplot gender jobcat, percent(jobcat)

tab gender jobcat, cell
tab gender jobcat, expected
tab gender jobcat, chi2


correlate salary age educ salbegin jobtime prevexp
* bivariate scatter plot
twoway (scatter salary salbegin)
* scatterplotmatrix 
graph matrix salary age educ salbegin jobtime prevexp

*Dataset: gss02subset.sav
use "gss02subset.dta", clear

*1.Verify if respondents work in average 40 hours per week (NUMBER OF HOURS WORKED LAST WEEK)
hist hrs1
summ hrs1
hist hrs1
* note that thare are 'strange' values. You must exlude repsondend that are not working

preserve 
* when you delete observations is always better to preserve the orginal data
drop if hrs1<0

hist hrs1
summ hrs1
graph box hrs1
ci means hrs1
ci means hrs1, level(99)
ttest hrs1 == 40

*2.	Does the average number of weekly working hours differ between males and females?
ciplot hrs1, by(sex)
graph box hrs1, over(sex)
ttest hrs1, by(sex)

*3.	Does the number of hours worked weekly depends on CONDITION OF HEALTH?
* check the distribution of variable (to see how many catagories you have abd if you have missing or strange values)
tab health 
 
*You can see the value label inside the Manage value labels Manu (from properties in the data or from the emnu Data)
* observe that the variable health have a descending order, more over 0 is NAP, 8 is NA and 9 is DK

drop if (health==0 | health==8 | health==9)

oneway hrs1 health, tabulate

*4.	Does the CONDITION OF HEALTH influence the GENERAL HEPPINESS?
drop if (happy==0 | happy==8 | happy==9)
tab health happy, chi2 row

tabplot health happy, percent(health)

restore
log close 
cmdlog close

