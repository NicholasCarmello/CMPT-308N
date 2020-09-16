-- This is Lab3 By Nicholas Carmello. Queries are numbered 1-10. The date is September 16th, 2020.
--1
select ordernum, totalusd
from orders;

--2
select lastname, homecity
from people
where prefix = 'Dr.';
--3
select *
from products
where qtyonhand > 1007;
--4
select firstname, homecity
from people
where dob between '1950-01-01' and '1959-12-31';
--5
select prefix,lastname
from people
where prefix != 'Mr.';
--6
select *
from products
where city != 'Duluth' and city != 'Dallas' and priceusd > 3.00;
--7
select *
from orders
where extract(month from dateordered) = 3;
--8
select *
from orders
where extract(month from dateordered) = 2 and totalusd > 20000;
--9
select *
from orders
where custid in(
		select pid
		from customers
		where pid ='007');
--10
select *
from orders
where custid in(
		select pid
		from customers
		where pid ='005');


