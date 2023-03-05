use sakila;

# Task: Create a table rentals_may to store the data from rental table with information for the month of May

select * from rental;		# to see what columns I need to create

create table rentals_may (
	rental_id int default null,
    rental_date timestamp default null,
    inventory_id int default null,
    customer_id int default null,
    return_date timestamp default null,
    staff_id int default null,
    last_update timestamp default null
    );


# Task: Insert values in the table rentals_may using the table rental, filtering values only for the month of May

insert into rentals_may
select * from rental
where month(rental_date) = 05;		# since May is the 5th month

select * from rentals_may;

# Task: Create a table rentals_june to store the data from rental table with information for the month of June

create table rentals_june (		# same columns as for rentals_may
	rental_id int default null,
    rental_date timestamp default null,
    inventory_id int default null,
    customer_id int default null,
    return_date timestamp default null,
    staff_id int default null,
    last_update timestamp default null
    );

# Task: Insert values in the table rentals_june using the table rental, filtering values only for the month of June

insert into rentals_june
select * from rental
where month(rental_date) = 06;

select * from rentals_june;

# Task: Check the number of rentals for each customer for May

select customer_id, count(rental_id) as may_num_rentals from rentals_may		# the simple way to do it doesn't show me the name of the customer
group by customer_id
order by may_num_rentals desc;

select C.customer_id, C.first_name, C.last_name, count(RM.rental_id) as may_num_rentals		# since I'd like to include the names I created a join between the tables customer and rental
from rentals_may RM
inner join customer C
on RM.customer_id = C.customer_id
group by customer_id
order by may_num_rentals;

# Task: Check the number of rentals for each customer for June

select C.customer_id, C.first_name, C.last_name, count(RJ.rental_id) as june_num_rentals		# same as above
from rentals_june RJ
inner join customer C
on RJ.customer_id = C.customer_id
group by customer_id
order by june_num_rentals;