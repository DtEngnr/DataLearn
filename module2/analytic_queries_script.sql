select SUM(sales) as total_sales
from orders;

select SUM(profit) as total_profit
from orders;

select concat(round( SUM(profit) / SUM(sales) * 100, 2), '%') as profit_ratio
from orders;

select order_id, profit       -- profit per order
from orders;

select customer_name, sum(sales) as sales       -- sales per customer
from orders
group by 1;


select AVG(discount) as average_discount
from orders;

select extract(year from order_date) || '-' || lpad(extract(month from order_date)::text, 2, '0') as month, 
segment, 
SUM(sales) as segment_monthly_sales -- Monthly sales by each segment(all years)
from orders
group by 1, 2
order by 1;

select extract(year from order_date) || '-' || lpad(extract(month from order_date)::text, 2, '0') as month, 
category, SUM(sales) as product_category_montly_sales
from orders 
group by 1, 2  -- Monthly sales by each segment(all years)
order by 1;

select category, sum(sales) as total_sales
from orders  -- sales by category over time 
group by 1;

select customer_name, sum(sales) as sales, sum(profit) as profit
from orders  -- sales and profit per customer
group by 1;

select customer_name, row_number() over(order by sum(sales))
from orders 
group by 1  -- Ranking cusomers by total sales
limit 10;

select region, round(sum(sales)) region_sales
from orders                                 -- sales per region over time
group by 1
order by 2 desc;
