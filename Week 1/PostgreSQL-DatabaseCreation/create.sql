create table cars(
	id int primary key,
	vin char(17),
	manufacturer varchar(20),
	model varchar(20),
	year int,
	color varchar(10)
);

create table customers(
	id int primary key,
	customer_id int,
	name varchar(40),
	phone varchar(20),
	email varchar(40),
	address varchar(40),
	city varchar(20),
	state_province varchar(20),
	country varchar(20),
	postal int
);

create table salespersons(
	id int primary key,
	staff_id varchar(20),
	name varchar(20),
	store varchar(20)
);

create table invoices(
	id int primary key,
	invoice_number int,
	date date,
	car int,
	customer int,
	sales_person int
);

alter table invoices
	add constraint fk_invoices_cars foreign key (car) references cars (id),
	add constraint fk_invoices_customers foreign key (customer) references customers (id),
	add constraint fk_invoices_salespersons foreign key (sales_person) references salespersons (id);