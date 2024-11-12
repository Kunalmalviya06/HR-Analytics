use kunal1;

SELECT * FROM dataset LIMIT 5;

-- Q1 What is the overall attrition rate at Adecco India?

SELECT 
    CONCAT(ROUND((SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END
    ) / COUNT(*)) * 100, 2), '%') AS attrition_rate_percentage
FROM 
    dataset;
    
-- Q2 Which department has the highest attrition rate?

select Department, count(Attrition) as Attrition from dataset
where attrition = 'yes'
group by Department
order by Attrition Desc;

--  Q3 What is the average age of employees who have left the company?

select round(avg(age),0) as Average_Age from dataset;

-- Q4 How does job satisfaction vary across different job roles?

select jobrole , AVG(jobsatisfaction)
from dataset 
group by jobrole;

-- Q5 Is there a significant difference in attrition rates between male and female employees?

select Gender , count(Attrition)
from dataset
where attrition = 'yes'
group by gender
order by count(attrition) desc;

-- Q6 What is the average monthly income of employees who have left the company?

select concat("₹ ",round(avg(monthlyincome),2)) as Average_Monthly_Income 
from dataset
where attrition = 'yes';

-- Q7 How many employees work overtime regularly?

select count(*) as Count_Overtime_Employees
from dataset
where overtime = 'yes';

-- Q8 What is the average number of years employees have worked at Adecco India?

select round(avg(yearsatcompany),0) AS Average_Years
from dataset;

-- Q9 How does the attrition rate vary with different levels of job involvement?

select jobinvolvement , count(attrition)
from dataset 
where attrition = 'yes'
group by jobinvolvement;

-- Q10 What are the top three factors contributing to employee attrition at Adecco India?
-- 1. Age Group
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 43 THEN '31-43'
        WHEN age BETWEEN 44 AND 56 THEN '44-56'
        ELSE '56+' 
    END AS age_group,
    COUNT(attrition) AS count
FROM 
    dataset
WHERE Attrition = 'yes'
GROUP BY 
    age_group, 
    attrition
ORDER BY 
    count(Attrition) desc;
    
-- 2. Monthly Income 
SELECT 
    CASE 
        WHEN monthlyincome BETWEEN 1009 AND 5008 THEN '1009-5008'
        WHEN monthlyincome BETWEEN 5009 AND 9008 THEN '5009-9008'
        WHEN monthlyincome BETWEEN 9009 AND 13008 THEN '9009-13008'
        WHEN monthlyincome BETWEEN 13009 AND 17008 THEN '13009-17008'
        WHEN monthlyincome BETWEEN 17009 AND 21008 THEN '17009-21008'
        ELSE '21009+' 
    END AS income_group,
    COUNT(attrition) AS count
FROM 
    dataset
WHERE 
    attrition = 'yes'
GROUP BY 
    income_group
ORDER BY 
    count(Attrition) desc;
    
-- 3 Years At Company

SELECT 
    CASE 
        WHEN YearsAtCompany BETWEEN 0 AND 9 THEN '0-9 years'
        WHEN YearsAtCompany BETWEEN 10 AND 19 THEN '10-19 years'
        WHEN YearsAtCompany BETWEEN 20 AND 29 THEN '20-29 years'
        WHEN YearsAtCompany BETWEEN 30 AND 39 THEN '30-39 years'
        WHEN YearsAtCompany BETWEEN 40 AND 49 THEN '40+ years'
        ELSE 'Unknown' 
    END AS years_group,
    COUNT(*) AS count
FROM 
    dataset
WHERE
    Attrition = 'yes'
GROUP BY 
    years_group
ORDER BY 
    years_group;
    



