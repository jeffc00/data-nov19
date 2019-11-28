--challenge 1
select
	a.au_id as "AUTHOR ID",
	a.au_lname as "LAST NAME",
	a.au_fname as "FIRST NAME",
	t.title as "TITLE",
	p.pub_name as "PUBLISHER"
from authors as a
inner join titleauthor as ta on a.au_id = ta.au_id
inner join titles as t on ta.title_id = t.title_id
inner join publishers as p on t.pub_id = p.pub_id;

--chalenge 2
select
	a.au_id as "AUTHOR ID",
	a.au_lname as "LAST NAME",
	a.au_fname as "FIRST NAME",
	p.pub_name as "PUBLISHER",
	count(*) as "TITLE COUNT"
from authors as a 
inner join titleauthor as ta on a.au_id = ta.au_id
inner join titles as t on ta.title_id = t.title_id
inner join publishers as p on t.pub_id = p.pub_id
group by
	a.au_id,
	a.au_lname,
	a.au_fname,
	p.pub_name
order by "TITLE COUNT" desc;

--challenge 3
select distinct
	a.au_id as "AUTHOR ID",
	a.au_lname as "LAST NAME",
	a.au_fname as "FIRST NAME",
	SUM(s.qty) as "TOTAL"
from authors as a
inner join titleauthor as ta on a.au_id = ta.au_id
inner join sales as s on ta.title_id = s.title_id
group by
	a.au_id,
	a.au_lname,
	a.au_fname
order by "TOTAL" desc
LIMIT 3;

--challenge 4
select
	a.au_id as "AUTHOR ID",
	a.au_lname as "LAST NAME",
	a.au_fname as "FIRST NAME",
	coalesce(SUM(s.qty), 0) as "TOTAL"
from authors as a
left join titleauthor as ta on a.au_id = ta.au_id
left join sales as s on ta.title_id = s.title_id
group by
	a.au_id,
	a.au_lname,
	a.au_fname
order by "TOTAL" desc;