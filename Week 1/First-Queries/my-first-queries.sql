--1
select distinct prime_genre from data;

--2
select
	prime_genre,
	sum(rating_count_tot) as total_count
from data
group by prime_genre
order by total_count desc
limit 1;

--3
select
	prime_genre,
	count(prime_genre) as count
from data
group by prime_genre
order by count desc
limit 1;

--4
select
	prime_genre,
	count(prime_genre) as count
from data
group by prime_genre
order by count asc
limit 1;

--5
select
	track_name,
	rating_count_tot,
	user_rating
from data
order by rating_count_tot desc
limit 10;

--6
select
	track_name,
	rating_count_tot,
	user_rating
from data
order by user_rating desc
limit 10;

--7
/* These are mostly composed of social media and entertainment apps
with the exception of the Bible. In paritcular, 4 out of the 10 apps related to games.
The amount of ratings these apps got could be explained by their great popularity. */

--8
/* Again we see the predominance of gaming apps. I guess the remaining apps
could be categorized as utility apps. */

--9
/* None of the apps in 5 appear in 6. The apps in 6 probably have a much smaller user base
then those in 5, hence tend to receive less ratings, which could ultimately lead to biased
results. */

--10
select
	track_name,
	user_rating,
	rating_count_tot
from data
order by
	user_rating desc,
	rating_count_tot desc
limit 3;

--11
select
	price,
	cast(avg(rating_count_tot) * avg(user_rating) as int) as popularity
from data
group by price
order by price desc;

/* Using rating_count_tot * user_rating as a proxy for popularity, it seems that, 
in general, cheaper apps tend to be more popular the expensive ones. */