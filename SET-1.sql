--Q1: Who is the senior most employee based on job title?
select title, 
	last_name, 
	first_name from employee 
	order by levels desc 
	limit 1

--Q2: Which countries have the most Invoices?
select count(*) as No_Invoice,
	billing_country
	from invoice 
	group by billing_country 
	order by No_Invoice desc 
	limit 1

--Q3: What are top 3 values of total invoice?
select total 
	from invoice 
	order by total desc 
	limit 3

--Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.
select billing_city,sum(total) Citysum
	from invoice 
	group by billing_city
	order by Citysum desc
	limit 1

--Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money.
select c.customer_id,first_name,last_name, sum(total) as TotalInvoice
	from customer c 
	join invoice i 
	on c.Customer_Id = i.customer_Id 
	group by c.customer_id
	order by TotalInvoice desc
	limit 1





