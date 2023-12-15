-- 1
-- Remove a previously inserted film from the inventory and all corresponding rental records
delete from rental
where inventory_id in (
    select inventory_id
    from inventory
    where film_id = (select film_id from film where upper(title) = upper('Ocean''s eleven'))
);
delete from inventory
where film_id = (select film_id from film where upper(title) = upper('Ocean''s eleven'));

-- 2
-- Remove any records related to you (as a customer) from all tables 
-- except "Customer" and "Inventory"
delete from payment where customer_id = 3;
delete from rental where customer_id = 3;


-- simple selects to check workability of programm
-- select * from inventory order by inventory_id desc
-- select * from rental order by rental_id desc
-- select * from payment where customer_id = 3
-- select * from rental where customer_id = 3