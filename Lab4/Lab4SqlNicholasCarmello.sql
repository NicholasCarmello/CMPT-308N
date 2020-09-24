--1
select *
from people
where pid in (
	select pid
	from customers
);


--2
select *
from people
where pid in (
	select pid
	from agents
);


--3
select * 
from people
where pid in (
			select pid
			from agents
			where pid in(
						select pid
						from customers
						)
);


--4
select *
from people
where pid not in(
				select pid
				from agents
				) and pid not in (
					select pid
					from customers
				);

--5
select pid
from customers
where pid in(
			select  custid
			from orders
			where prodid = 'p01' or prodid ='p7'
	
);

--6-- this works check one last time.
select distinct pid
from customers

where pid in(
			select  custid
			from orders
			where prodid = 'p01' 
	
) and pid in (select custid
			  from orders
			  where prodid = 'p07')
order by pid desc;


--7-- this works, I checked 
select  firstname, lastname
from people
where pid in (
			select pid
			from agents
			where pid in (
						select agentid
						from orders
						where prodid = 'p07' or prodid = 'p05'
						)
	
)
order by lastname desc;

--8-- Tis works

select dob, homecity
from people
where pid in (
				select pid
				from agents
				where pid in(
								select  agentid
								from orders
								where custid = '1'
				
								)

				)
order by homecity asc;



--9--Works but is this it?


select distinct prodid
from products
where prodid in (
			select prodid 
			from orders
			where exists(select pid
						 from people
						 where homecity = 'Toronto'
						)
	)
order by prodid desc;





--10--
select lastname, firstname
from people
where pid in (
			select pid
			from customers
			where pid in (
							select custid
							from orders
							where agentid in (select pid
											  from people
											  where homecity = 'Teaneck' or homecity = 'Santa Monica'
												)
							
						)
			);
				
				



