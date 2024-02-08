use sakila; 

# 1. Drop column picture from staff
select * from staff; 
alter table staff drop column picture; 

# 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from staff; 
select email, address_id , active from customer where first_name = 'TAMMY' and last_name = 'SANDERS'; 

insert into staff 
values 
(3, 'Tammy', 'Sanders', 79, 'TAMMY.SANDERS@sakilacustomer.org', 3, 1, 'Tammy', null); 



# 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
select inventory_id from inventory
where film_id = '1'; 
#customer id = 130
#film_id = 1
#stuff id = null
#inventory id = 
select * from rental; 

insert into rental (rental_id, rental_date, customer_id, return_date)
values
(1, '2024-02-08 14:06:34', 130, '2024-02-12 22:20:34');  


#4. Checking for non active users
select * from customer; 
select count(customer_id) from customer where active = '0'; 
# There are 15 inactive users
select customer_id, email, create_date from customer where active = '0';

# Creating a backup table
create table deleted_users(
customer_id int,
email text,
date int); 
select * from deleted_users; 

# Insert the non active users in the backup table
select * from deleted_users; 

insert into deleted_users
values 
(16, "SANDRA.MARTIN@sakilacustomer.org", 2006-02-14),
(64, "JUDITH.COX@sakilacustomer.org", 2006-02-14),
(124, "SHEILA.WELLS@sakilacustomer.org", 2006-02-14),
(169, "ERICA.MATTHEWS@sakilacustomer.org", 2006-02-14), 
(241, "HEIDI.LARSON@sakilacustomer.org", 2006-02-14),
(271, "PENNY.NEAL@sakilacustomer.org", 2006-02-14), 
(315, "KENNETH.GOODEN@sakilacustomer.org", 2006-02-14), 
(368, "HARRY.ARCE@sakilacustomer.org", 2006-02-14),
(406, "NATHAN.RUNYON@sakilacustomer.org", 2006-02-14),
(446, "THEODORE.CULP@sakilacustomer.org", 2006-02-14),
(482, "MAURICE.CRAWLEY@sakilacustomer.org", 2006-02-14), 
(510, "BEN.EASTER@sakilacustomer.org", 2006-02-14),
(534, "CHRISTIAN.JUNG@sakilacustomer.org", 2006-02-14), 
(558, "JIMMIE.EGGLESTON@sakilacustomer.org", 2006-02-14), 
(592, "TERRANCE.ROUSH@sakilacustomer.org", 2006-02-14); 

select * from deleted_users; 


# Delete the non active users from the table customer
select * from customer; 
delete customer_id from customer where active = '0';
