create database Bank_loan_project;
use Bank_loan_project;

select count(*) from finance_1;
select count(*) from finance_2;

select	* from finance_1;
select	* from finance_2;
/* #Questions
> Year wise loan amount Stats

> Grade and sub grade wise revol_bal

> Total Payment for Verified Status Vs Total Payment for Non Verified Status

> State wise and last_credit_pull_d wise loan status

>  Home ownership Vs last payment date stats
*/

# KPI 1 #Year wise loan amount Stats

select year(issue_d) as year_of_issue_d, sum(loan_amnt) as total_loan_amnt
from finance_1 
group by year_of_issue_d
order by year_of_issue_d;

# KPI 2 # Grade and sub grade wise revol_bal

select grade ,sub_grade , sum(revol_bal) as total_revol_bal 
from finance_1 inner join finance_2 on(finance_1.id = finance_2.id)
group by
 grade ,sub_grade
order by
 grade ,sub_grade;

# KPI 3 # Total Payment for Verified Status Vs Total Payment for Non Verified Status

select verification_status ,concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
from finance_1 inner join finance_2 on(finance_1.id = finance_2.id)
group by
  verification_status
order by
 verification_status;

#KPI 4 # State wise and last_credit_pull_d wise loan status

select addr_state, last_credit_pull_D , loan_status
from finance_1 inner join finance_2 on(finance_1.id = finance_2.id)
group by
  addr_state, last_credit_pull_D , loan_status
order by 
 addr_state, last_credit_pull_D , loan_status;

# KPI 5 #  Home ownership Vs last payment date stats
 
select home_ownership ,  last_pymnt_d,
 concat("$",format(round(sum(last_pymnt_amnt)/10000,2),2),"K") as total_AMOUNT 
from finance_1 inner join finance_2 on(finance_1.id = finance_2.id)
group by 
 home_ownership ,  last_pymnt_d
order by
  home_ownership ,  last_pymnt_d;
  
# kpi 5 Total payment amount
select concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment from finance_2;

#kpi 6 Total loan amount
select concat("$",format (round(sum(loan_amnt)/1000000,2),2),"M") as total_amount from finance_1;

# kpi 7 Total account holder
select count(id) from finance_1; 