*** LAB 2 ***

*Set working directory
*Start a log file
*Load Stata the dataset i

cd "/Users/silviasalini/Google Drive/Advanced Data Analysis IPLE/Lab2"
log using Lab2, replace
cmdlog using Lab2, replace 

use "Employee data.dta", clear

*1.	Get the age variable from the date of birth
gen year=year( bdate )
gen age=2016 - year
label variable age "Age of respondent"
drop year

*2.	Describe the variable age and calculate the confidence intervals for the mean
histogram age, discrete width(5)
histogram age, discrete width(10)
histogram age, discrete width(1)

sum age
sum age, detail
ci means age 

*3.	Calculate the z-score for age and plot it 
* you can do manually
gen zage=(age-59.6723)/ 11.78409
* you can do automatically 
*findit zscore
zscore age
histogram z_age, discrete width(1)
* compare on the data viewer zage z_age 
drop zage

* if you need to calculate CI without data, only using sample statistics
* calculate confidence intervals for the mean 
* sample mean=34, sample standard deviation=4, n=100
cii means 100 34 4
cii means 100 34 40
cii means 1000 34 40
cii means 100 34 4, level(90)

* calculate confidence intervals proportion exact
cii proportions 100 70, exact
* calculate confidence intervals proportion normal approximation (wald)
cii proportions 100 70, wald
* check the calculus applying the formula p +/- sqrt((p(1-p))/n) * z(1-alpha/2)

*4.	Check whether the average salary of employees is equal to 30,000 euros
* you can calculate the CI and observ that 30000 is not included 
ci mean salary

*(One-Sample t test)
ttest salary == 30000

* calulator for the ttest
ttesti 30 45 9 40
ttesti 30 45 19 40
ttesti 300 45 19 40

*5.Check if the average salary of the males is different from that of the females both graphically and through an appropriate test*
*(Two-sample t test)
graph box salary, over(gender)
*findit ciplot
ciplot salary, by(gender)
ttest salary, by(gender)

*6.Check whether the current average salary has significantly increased compared to the initial salary
* (Paired-Sample t test)
ttest salary == salbegin
* Rememeber that you can also comapre means of two variables not paired (Ex. Sales of vegetarian food VS Sales of vegan food)
*ttest var1 == var2, unpaired

log close 
cmdlog close
