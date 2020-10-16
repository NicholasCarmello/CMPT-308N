--1--good
select city, count(city)
from products
group by city
limit 2;



--2-- Good
select prodid, avg(priceusd) as aboveAverage
from products
group by prodid
having avg(priceusd) >= (select avg (priceusd) from products)
order by priceusd desc;



---3--Good

select distinct prodid, totalusd, lastname
from orders o inner join people p on o.custid = p.pid
where Extract(month from dateordered) = 3
order by totalusd desc;



--4--Good--


select p.lastname, sum(totalusd)
from people p inner join customers c on p.pid = c.pid
inner join orders o on c.pid = o.custid
group by lastname
order by lastname desc;





--5--Good--needs cust names
select  distinct prod.name, p.lastname
from people p inner join agents a on p.pid = a.pid
inner join orders o1 on a.pid = o1.agentid
inner join orders o2 on o1.custid = o2.custid
inner join products prod on o2.prodid = prod.prodid
where p.homecity = 'Teaneck';
	

--6--Might be it?--No incorrect answers because I rounded?
select (quantityordered * priceusd) - (quantityordered * priceusd)  * (discountpct  / 100)as realPrice, o.ordernum,o.dateordered, o.custid
, o.agentid,o.prodid,o.quantityordered, o.totalusd
from orders o left join products pr on pr.prodid = o.prodid
left join customers c on c.pid = o.custid
where o.prodid in (
					select prodid
				from products)
and
round((quantityordered * priceusd) - (quantityordered * priceusd)  * (discountpct  / 100))  != round(totalusd);

--7--Good
select firstname, lastname
from people
where pid in(select pid
			from customers
			where pid in (
				select pid 
				from agents));

--8-- 
--CREATE VIEW PeopleCustomers
--as
--select p.pid, p.prefix, p.firstname, p.lastname, p.suffix, p.homecity, p.dob, c.discountpct, c.paymentterms
--from people p full outer join customers c on p.pid = c.pid;

--Create view PeopleAgents
--as
--select p.pid, p.prefix, p.firstname, p.lastname, p.suffix, p.homecity, p.dob, a.paymentterms,a.commissionpct
f--rom people p full outer join agents a on a.pid = p.pid;

select *
from PeopleCustomers;

select *
from PeopleAgents;

--9--Good-
select pa.lastname, pa.firstname
from PeopleAgents pa inner join PeopleCustomers pc on pc.pid = pa.pid
where discountpct is not null and commissionpct is not null;

--10--
--The database internally is going back to the view that is created and comparing the results from the queries that we made to support the view.
--It goes through the querys we made for PeopleAgents and PeopleCustomers and for my #9, I happen to join them and compare where its not nulls


--11--
--The difference between a left outer join is the join returns everything on the leftside of the query. 
--The right outjoin returns everything on the right.

select *
from people p left join  customers c on c.pid = p.pid;

select *
from people p right join customers c on p.pid = c.pid;


