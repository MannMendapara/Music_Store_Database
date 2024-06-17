--Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A.
select distinct email,first_name,last_name, g.name from customer c
	join invoice i on c.customer_id = i.customer_id
	join invoice_line il on i.invoice_id = il.invoice_id
	join track t on il.track_id = t.track_id
	join genre g on t.genre_id = g.genre_id 
	where g.name like 'Rock'
	order by email

-- Q2: Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands.
SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
	FROM track
	JOIN album ON album.album_id = track.album_id
	JOIN artist ON artist.artist_id = album.artist_id
	JOIN genre ON genre.genre_id = track.genre_id
	WHERE genre.name LIKE 'Rock'
	GROUP BY artist.artist_id
	ORDER BY number_of_songs DESC
	LIMIT 10;

--Q3: Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.
SELECT name,milliseconds
	FROM track
	WHERE milliseconds > (
		SELECT AVG(milliseconds) AS avg_track_length
		FROM track )
	ORDER BY milliseconds DESC;