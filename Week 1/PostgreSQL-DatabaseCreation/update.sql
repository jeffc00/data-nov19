update salespersons
set store = 'Miami'
where id = 4;

update customers set email = case
	when id = 0 then 'ppicasso@gmail.com'
	when id = 1 then 'lincoln@us.gov'
	when id = 2 then 'hello@napoleon.me'
end;