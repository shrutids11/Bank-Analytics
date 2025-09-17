create database bank_analytics;
select * from finance_1;

#KPI 1 Year wise loan amount 
select year(issue_d) as Years, sum(loan_amnt) as loan_amount
from finance_1
group by Years
order by Years;

#KPI 2 Grade and Sub Grade wise Revol_Bal
select grade,sub_grade, sum(revol_bal) as Revol_bal
from finance_1
join finance_2
on (finance_1.id=finance_2.id)
group by Grade, sub_grade
order by  Grade, sub_grade;

#KPI 3 Total Payment for verified status Vs Total Payment for Non Verified Status
select verification_status , round(sum(total_pymnt),2)as Total_Payment 
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by verification_status;

#KPI 4 State wise loan status 
select addr_state as State, loan_status as Loan_Status
from finance_1 
group by addr_state, loan_status
Order by addr_state;

#KPI 5 Month wise loan status 
select month(finance_2.last_pymnt_d) pay_month, count(finance_1.loan_status) as loan_status
from finance_1 join finance_2 
on(finance_1.id = finance_2.id)
group by pay_month
order by loan_status;

#KPI 6 Home Ownership Vs last payment date stats
select home_ownership as Home_Ownership, last_pymnt_d as Last_Payment_Date,
concat("$",format(round(sum(last_pymnt_amnt)/10000,2),2)," ","K") as Last_Payment_Amount
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by home_ownership, last_pymnt_d
order by last_pymnt_d desc, home_ownership desc;




