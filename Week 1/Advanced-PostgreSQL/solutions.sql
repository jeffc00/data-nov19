--challenge 1
--step 1
select
	t.title_id,
	ta.au_id,
	cast(t.advance as float) * ta.royaltyper / 100 as advance,
	cast(t.price as float) * s.qty * cast(t.royalty as float) / 100 * ta.royaltyper / 100 as sales_royalty
from titles as t
inner join titleauthor as ta on t.title_id = ta.title_id
inner join sales as s on ta.title_id = s.title_id;

--step 2
select
	title_id,
	au_id,
	sum(sales_royalty) as aggregated_royalties,
	sum(advance) as aggregated_advances
from (select
	  	t.title_id,
		ta.au_id,
		cast(t.advance as float) * ta.royaltyper / 100 as advance,
		cast(t.price as float) * s.qty * cast(t.royalty as float) / 100 * ta.royaltyper / 100 as sales_royalty
	from titles as t
	inner join titleauthor as ta on t.title_id = ta.title_id
	inner join sales as s on ta.title_id = s.title_id) as subquery
group by
	title_id,
	au_id;

--step 3
select
	au_id,
	aggregated_royalties + aggregated_advances as total_profits
from (select
		title_id,
		au_id,
		sum(sales_royalty) as aggregated_royalties,
		sum(advance) as aggregated_advances
	from (select
			t.title_id,
			ta.au_id,
			cast(t.advance as float) * ta.royaltyper / 100 as advance,
			cast(t.price as float) * s.qty * cast(t.royalty as float) / 100 * ta.royaltyper / 100 as sales_royalty
		from titles as t
		inner join titleauthor as ta on t.title_id = ta.title_id
		inner join sales as s on ta.title_id = s.title_id) as subquery
	 group by
	 	title_id,
	  	au_id) as subquery2
order by total_profits desc
limit 3;

--challenge 2
create temporary table temp_table1 as
select
	t.title_id,
	ta.au_id,
	cast(t.advance as float) * ta.royaltyper / 100 as advance,
	cast(t.price as float) * s.qty * cast(t.royalty as float) / 100 * ta.royaltyper / 100 as sales_royalty
from titles as t
inner join titleauthor as ta on t.title_id = ta.title_id
inner join sales as s on ta.title_id = s.title_id;

create temporary table temp_table2 as
select
	title_id,
	au_id,
	sum(sales_royalty) as aggregated_royalties,
	sum(advance) as aggregated_advances
from temp_table1
group by
	title_id,
	au_id;

create temporary table temp_table3 as
select
	au_id,
	aggregated_royalties + aggregated_advances as total_profits
from temp_table2
order by total_profits desc
limit 3;

select * from temp_table3;

--challenge 3
create table most_profiting_authors as
select * from temp_table3;

select * from most_profiting_authors;