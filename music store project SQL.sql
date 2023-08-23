-- Q1 : senior most employee based on job title?
select *
from employee
order by levels desc
limit 1
-- ans = madan mohan , level = L7


-- Q2 : country with most invoice?
select count(*) as "invoicecount", billing_country
from invoice
group by billing_country
order by "invoicecount" desc
limit 1
-- ans = USA-131


-- Q3 : top 3 values of total invoice?
select *
from invoice
order by total desc
limit 3
-- ans = 1)23.7599999 , 2)19.8 , 3)19.8


 -- Q4 : Which city has the best customers? We would like to throw a promotional Music 
 -- Festival in the city we made the most money. Write a query that returns one city that 
 -- has the highest sum of invoice totals. Return both the city name & sum of all invoice 
 -- totals
 select sum(total) as "total_billing", billing_city
 from invoice
 group by billing_city
 order by "total_billing" desc
 limit 1
--  ans = prague , 273.24000


-- Q5 : Who is the best customer? The customer who has spent the most money will be 
-- declared the best customer. Write a query that returns the person who has spent the 
-- most money??
select a.first_name,a.last_name,sum(b.total) as "total_spent"
from customer a
inner join invoice b
on a.customer_id = b.customer_id
group by a.first_name,a.last_name 
order by "total_spent" desc
limit 1
-- ans = R Madhav , 144.5400000


-- Q6 : Write query to return the email, first name, last name, & Genre of all Rock Music 
-- listeners. Return your list ordered alphabetically by email starting with A?
select distinct email,first_name, last_name
from customer
join invoice ON customer.customer_id = invoice.customer_id
join invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;
-- ans = check the query by running it


-- Q7 : Let's invite the artists who have written the most rock music in our dataset. Write a 
-- query that returns the Artist name and total track count of the top 10 rock bands
SELECT DISTINCT email AS Email,first_name AS FirstName, last_name AS LastName, genre.name AS Name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email;
-- ans = check the query by running it


-- Q8 : Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the 
-- longest songs listed first
SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;
-- ans = check the query by running it

-- Q9 : Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the 
-- longest songs listed first 
select name, milliseconds
from track
where milliseconds>(select avg(milliseconds) as avg_lenght
				   from track)
order by milliseconds desc			
-- ans = check the query by running it





