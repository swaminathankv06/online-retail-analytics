CREATE DATABASE online_retail_project;
USE online_retail_project;

CREATE TABLE online_retail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(100)
);

select count(*) from online_retail;
    
 select *
 from online_retail
 limit 10;
 
 select sum(quantity * unitprice) as total_sales
 from online_retail;
 
 select 
	country, 
    ROUND(SUM(quantity * unitprice), 2) as total_sales
from online_retail
group by country
order by total_sales DESC
limit 10;    
 
 select 
	Description, 
    ROUND(SUM(quantity * unitprice), 2) as total_sales
from online_retail
group by Description
order by total_sales DESC
limit 10;  

 select 
	customerid, 
    ROUND(SUM(quantity * unitprice), 2) as total_sales
from online_retail
where customerid is not null
group by customerid
order by total_sales DESC
limit 10;  

select
	date_format(
		str_to_date(invoicedate, '%d-%m-%y'),'%y-%m') as month,
    round(sum(quantity*unitprice), 2) as total_sales
    from online_retail
    group by month
    order by month;
    
select
	description,
    sum(quantity) as total_quantity_sold
    from online_retail
    group by description
    order by total_quantity_sold desc
    limit 10;
    
select
		country,
        sum(quantity) as total_quantity,
        round(sum(quantity*unitprice),2) as total_sales
        from online_retail
        group by country
        order by total_sales desc;

select	
	invoiceno,
    round(sum(quantity*unitprice),2) as order_value
    from online_retail
    group by invoiceno
    order by order_value desc
    limit 10;

select 
	round(avg(order_value), 2) as average_order_value
from (
	select 
		invoiceno, 
        sum(quantity*unitprice) as order_value
	from online_retail
    group by invoiceno
) as orders;

select
	customerid,
    count(distinct invoiceno) as number_of_orders
from online_retail
where customerid is not null
group by customerid
order by number_of_orders desc
limit 10;