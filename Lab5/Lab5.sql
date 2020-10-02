--1--
select p.*
from customers c  inner join people p on p.pid = c.pid;

--2--
select p.*
from agents a inner join people p on p.pid = a.pid;

--3--
select p.*, a.*
from agents a inner join people p on p.pid = a.pid
inner join customers c on c.pid = a.pid;

--4--
select firstname
from people
where pid in(
			select pid
			from customers
			where pid not in (
							select custId
							from orders
								)
			);
			
--5--
select p.firstname
from people p inner join customers c on c.pid = p.pid
full join orders o on o.custid = c.pid
where ordernum is Null;


	
--6--
select a.pid, a.commissionpct
from agents a inner join orders o on o.agentid = a.pid
where o.custid = '008'
order by commissionpct asc;



	
--7--
select distinct p.lastname, p.homecity, a.commissionpct
from people p inner join agents a on a.pid = p.pid
inner join orders o on a.pid = o.agentid
where custid = '001'
order by commissionpct desc;



--8--

select p.lastname, p.homecity
from products pr full join  people p on p.pid = pr.qtyonhand
where pr.city != 'Duluth'
group by p.lastname, p.homecity
having count(pr.city) = 1;
	


--9A--
select pr.prodid, pr.name
from products pr full join orders o on o.prodid = pr.prodid
full join agents a on a.pid = o.agentid
full join customers c on c.pid = o.custid
full join people p on p.pid = c.pid
where p.homecity = 'Chicago'
order by pr.name asc;
--9B--

	select distinct prodid,name
	from products
	where prodid in (
		select prodid
		from orders
		where agentid in (
			select agentid
			from orders
			where custid in (
				
				select pid
				from customers
				where pid in (
						select pid
						from people
						where homecity = 'Chicago')
			)))order by prodid asc;
			
						
								  
		



	
--10--
--I really can't figure out how to get the firstname and lastname of these people using joins but 
-- I got the homecity where there are 2 people from 
--
select count (p.homecity = 'toronto'), homecity
from agents a full join customers c on a.pid = c.pid
full join people p on c.pid = p.pid and a.pid = p.pid
group by p.homecity, homecity
having count(p.homecity) > 1;



--Just a test for 10--
select homecity, firstname, lastname
from people
where pid in (
				select pid
				from agents
				where pid in (
									select pid
									from people
									where homecity in(select homecity
													  from people
													  where pid in (select pid
																	from people
																	where pid in(select pid
																				 from customers
																	)))))
and pid != 5;





