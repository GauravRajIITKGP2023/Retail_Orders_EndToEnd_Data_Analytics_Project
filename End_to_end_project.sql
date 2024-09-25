select * from df_orders


--find top 10 highest reveue generating products 
select product_id , sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc
limit 10;

--find top 5 highest selling products in each region

with cte1 as (
select region, product_id,sum(sale_price) as sales
from df_orders
group by region,product_id
order by region,sales desc),

cte2 as(
	select *,row_number()over(partition by region order by sales desc) as rn
from cte1)

select * from cte2
where rn<=5


--find month over month (MOM) growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023

with cte1 as
(select EXTRACT (YEAR FROM order_date) as order_year ,EXTRACT(MONTH FROM order_date) as order_month,
sum(sale_price) as sales
from df_orders
group by order_year,order_month
order by order_year,order_month
)

select order_month, SUM(case when order_year=2022 then sales else 0 end) as sales_2022, 	
SUM(case when order_year=2023 then sales else 0 end) as sales_2023,
CASE WHEN SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) = 0 THEN NULL ELSE ROUND(
        (SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) - 
         SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END)) / 
         SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) * 100, 2) END AS MoM_Growth_Percentage
from cte1
group by order_month
order by order_month;


--for each category which month had highest sales 

with cte as (
        select 
	         category,
	          EXTRACT(year FROM order_date) as order_year,
              EXTRACT(MONTH FROM order_date) as order_month,
              sum(sale_price) as sales  
from df_orders
group by category,order_year,order_month
)

select * from (
select *, row_number() over(partition by category order by sales desc) as rn
from cte) a
where rn=1
ORDER BY order_year, order_month;





--which sub category had highest growth by profit in 2023 compare to 2022

with cte as
(select sub_category,EXTRACT (YEAR FROM order_date) as order_year, sum(sale_price) as sales
from df_orders
group by sub_category,order_year
)

select sub_category, SUM(case when order_year=2022 then sales else 0 end) as sales_2022, 	
SUM(case when order_year=2023 then sales else 0 end) as sales_2023,
from cte
group by sub_category




--which sub category had highest growth by profit in 2023 compare to 2022
with cte as (
select sub_category, EXTRACT(YEAR FROM order_date) as order_year,
sum(sale_price) as sales
from df_orders
group by sub_category,order_year
order by 
),
	
cte2 as (
select sub_category,
sum(case when order_year=2022 then sales else 0 end) as sales_2022,
sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte 
group by sub_category

)

select *, (sales_2023-sales_2022)/sales_2022*100 as a
from cte2
order by a desc
limit 1










