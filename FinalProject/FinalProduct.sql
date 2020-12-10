create table people (
	pid Serial primary key,
	firstname varchar(50),
	lastname varchar(50),
	fakeName varChar(50)
);


insert into People(firstname,lastname,fakeName) Values('Tchalla', 'Udaku','Black Panther');
insert into People(firstname,lastname,fakeName) Values('Scott', 'Lang','Ant-Man');
insert into People(firstname,lastname,fakeName) Values('Natasha', 'Romanoff','Black Widow');
insert into People(firstname,lastname,fakeName) Values('Walter', 'Lawson','Captain Marvel');
insert into People(firstname,lastname,fakeName) Values('Ancient One', 'None','None');
insert into People(firstname,lastname,fakeName) Values('Thanos', 'None','None');
insert into People(firstname,lastname,fakeName) Values('Dormammu', 'None','None');
insert into People(firstname,lastname,fakeName) Values('Wanda', 'Maximoff','Scarlet Witch');
insert into People(firstname,lastname,fakeName) Values('Clint', 'Barton','Hawkeye');
insert into People(firstname,lastname,fakeName) Values('Janet','Dyne','Wasp');
insert into People(firstname,lastname,fakeName) Values('Groot', 'None','None');
insert into People(firstname,lastname,fakeName) Values('Peter', 'Quill','Star-Lord');
insert into People(firstname,lastname,fakeName) Values('Nebula', 'None','None');
insert into People(firstname,lastname,fakeName) Values('Gamora', 'Titan','None');
insert into People(firstname,lastname,fakeName) Values('Groot', 'Tree','None');
insert into People(firstname,lastname,fakeName) Values('89P13', 'None','Rocket');
insert into People(firstname,lastname,fakeName) Values('Arthur', 'Douglas','Drax the destroyer');
insert into People(firstname,lastname,fakeName) Values('Yondu', 'Udonta','None');
insert into People(firstname,lastname,fakeName) Values('Ronan','None','None');
insert into People(firstname,lastname,fakeName) Values('Taneleer', 'Tivan','The collector');
insert into People(firstname,lastname,fakeName) Values('Johann', 'Schmidt','Red Skull');
insert into People(firstname,lastname,fakeName) Values('Justin', 'Hammer','None');
insert into People(firstname,lastname,fakeName) Values('Malekith', 'None','None');
insert into People(firstname,lastname,fakeName) Values('Quentin', 'Beck','Mysterio');
insert into People(firstname,lastname,fakeName) Values('Nick', 'Fury','None');
insert into People(firstname,lastname,fakeName) Values('James', 'Rhodes','War Machine');
insert into People(firstname,lastname,fakeName) Values('Howard', 'Stark','None');
insert into People(firstname,lastname,fakeName) Values('Sam', 'Wilson','Falcon');
insert into People(firstname,lastname,fakeName) Values('Vison', 'None','None');
insert into People(firstname,lastname,fakeName) Values('Carina', 'Tivan','None');
insert into People(firstname,lastname,fakeName) Values('Mantis', 'None','None');
insert into People(firstname,lastname,fakeName) Values('Bucky', 'Barnes','Winter Soldier');
insert into People(firstname,lastname,fakeName) Values('Ego the living planet', 'None','None');
insert into People(firstname,lastname,fakeName) Values('Norman', 'Osborn','Green Goblin');
insert into People(firstname,lastname,fakeName) Values('Eddie', 'Brock','Venom');
insert into People(firstname,lastname,fakeName) Values('Erik', 'Killmonger','None');
insert into People(firstname,lastname,fakeName) Values('Obadiah', 'Stane','None');
insert into People(firstname,lastname,fakeName) Values('Aldrich', 'Killian','None');
insert into People(firstname,lastname,fakeName) Values('Gunter', 'Otto','Doctor Octopus');
insert into People(firstname,lastname,fakeName) Values('Curtis', 'Connors','Lizard');
insert into People(firstname,lastname,fakeName) Values('Flint', 'Marko','Sandman');
insert into People(firstname,lastname,fakeName) Values('Harry', 'Osborn','New Goblin');
insert into People(firstname,lastname,fakeName) Values('Hela', 'Odinson','God of death');
insert into People(firstname,lastname,fakeName) Values('Mark', 'Scarlotti','Whiplash');
insert into People(firstname,lastname,fakeName) Values('Proxima', 'Midnight','None');
insert into People(firstname,lastname,fakeName) Values('Ebony', 'Maw','None');
insert into People(firstname,lastname,fakeName) Values('Adrian', 'Toomes','Vulture');
insert into People(firstname,lastname,fakeName) Values('Alexander', 'Pierce','None');
insert into People(firstname,lastname,fakeName) Values('Ultron', 'None','None');
insert into People(firstname,lastname,fakeName) Values('Proxima', 'Midnight','None');
insert into People(firstname,lastname,fakeName)Values('Alan', 'Labouseur', 'Professor');
insert into People(firstname,lastname,fakeName)Values('Tony', 'Stark', 'Iron man');







create table villain(
	pid int references People(pid),
	primary key(pid)
);


	


create table hero(
	pid int references People(pid),
	primary key(pid)
);

insert into villain(pid) values(1);
insert into villain(pid) values(47);


create table battle(
	battleName varChar(50) default 'Unknown',
	outcome boolean not null,
	battleAnniversary varChar default 'Unknown',
	primary key(battleName)
);

insert into battle (battleName,outcome,battleAnniversary) values ('Battle of Earth','true','October 2023');
insert into battle (battleName,outcome,battleAnniversary) values ('Battle of New York','true','May 4th, 2012');
insert into battle (battleName,outcome,battleAnniversary) values ('Civil war','true','May 6th, 2016');
insert into battle (battleName,outcome,battleAnniversary) values ('Battle of Asgard', 'false' , 'September 16th');




create table HeroInBattle (
		pid int references hero(pid),
		battleName varchar(50) references battle(battleName),
		primary key(pid,battleName)
);



create table VillainInBattle (
		pid int references villain(pid),
		battleName varchar(50) references battle(battleName),
		primary key(pid,battleName)

);






select firstname,lastname
from People
where pid in (select pid
			  from villain
			  where pid in( select pid
			  				from VillainInBattle
						  	where battleName = 'Battle of New York')
);



create view getAvengersInNewYork as
select firstname,lastname
from People
where pid in (select pid
			  from hero
			  where pid in( select pid
			  				from HeroInBattle
						  	where battleName = 'Battle of New York'));
							




create table powers(
	powerName varChar(50) not null,
	primary key(powerName)
);

insert into powers(powerName) values('superHumanStrength');
insert into powers(powerName) values('speed');
insert into powers(powerName) values('durability');
insert into powers(powerName) values('fly');
insert into powers(powerName) values('time manipulation');
insert into powers(powerName) values('fast healing');

create table hasPowers(
	powerName varChar(50) not null references powers(powerName),
	pid int not null references People(pid),
	primary key(powerName,pid)
);


insert into hasPowers(powerName, pid) values ('fly',1);






create table planet(
	PlID int not null primary key,
	planetName varChar(50) not null
);


insert into planet(PlID, planetName) values(1,'Asgard');
insert into planet(PlID, planetName) values(2,'Maveth');
insert into planet(PlID, planetName) values(3,'Xandar');
insert into planet(PlID, planetName) values(4,'Earth');
insert into planet(PlID, planetName) values(5,'Titan');


create table homeTo(
	pid int not null references People(pid),
	PlID int not null references planet(PlID),
	primary key(pid,PlID)
);

insert into homeTo(pid,PlID) values(1,1);
insert into homeTo(pid,PlID) values(5,4);
insert into homeTo(pid,PlID) values(3,4);
insert into homeTo(pid,PlID) values(8,1);


create table planetBattles(
	BattleName varchar(50) not null references battle(BattleName),
	PlID int not null references planet(PlID),
	primary key(PlID, BattleName)

);

insert into planetBattles(BattleName,PlID) values('Battle of Earth',4);
insert into planetBattles(BattleName,PlID) values('Battle of New York',4);
insert into planetBattles(BattleName,PlID) values('Battle of Asgard',1);






create view bothVillainAndHero as
select distinct pe.firstname, pe.lastname
from people pe inner join villain v on v.pid = pe.pid
inner join hero h on h.pid = pe.pid;



	





create table hasInfinityStone(
	pid int not null references people(pid),
	dateObtained date not null,
	whichStone Text not null,
	primary key(pid,dateObtained,whichStone)
);



create or replace view getMVP as 
select pe.firstname,pe.lastname,count(b.outcome)
from people pe inner join hero h on h.pid = pe.pid
inner join HeroInBattle hi on hi.pid = h.pid
inner join battle b on b.battlename = hi.battlename
where b.outcome is true
group by firstname,lastname
order by count desc
limit 1;






create view battlePlanets as
	select pe.firstname, pe.lastname,pl.planetName,count(pb.battleName)
	from people pe full outer join HomeTo H on pe.pid = h.pid
	inner join planet pl on pl.PlID = h.PlID
	inner join planetBattles pb on pb.PlID = h.PlID
	group by planetName,pe.firstname, pe.lastname
	order by count desc
	limit 1;
	



	









CREATE OR REPLACE FUNCTION getPeople(varChar,varchar,refcursor) RETURNS refcursor AS 
$$
	declare
		PowerID varChar = $1;
		nameID varChar = $2;
		resultset refcursor = $3;
	begin 
	  	open resultset for 
      		select firstname, lastname
			from people
			where pid in (select pid 
						  from hasPowers
						  where PowerName in(
							  					select PowerName
							  					from Powers
							  					where PowerName = PowerID	))
			and
			pid in (select pid
				   from hero
				   where pid in(select pid
								from HeroInBattle
				   				where battleName = nameID
				   ));
   		return resultset;
end;
$$
language plpgsql;
SELECT getPeople('superHumanStrength','Battle of New York','results');
FETCH ALL FROM results;























CREATE OR REPLACE FUNCTION deleteEverything() RETURNS trigger AS 
$$	
begin 
	  	delete from HeroInBattle
		where pid = old.pid;
		
		delete from hero
		where pid = old.pid;
		
		
		delete from VillainInBattle
		where pid = old.pid;
		
		delete from villain
		where pid = old.pid;
		

		delete from hasPowers
		where pid = old.pid;
		
		return old;
end;
$$
language plpgsql;



create trigger OneDelete
before Delete on People
for each row 
execute procedure deleteEverything();



create or replace view PeopleWithPowers
as
select *
from people
where pid in (select pid
			  from hasPowers);







create role Avengers;
	grant all on all tables in schema public to Avengers;


create role Villains;
Revoke all on all tables in schema public from Villains;
grant select on all tables in schema public to Villains;

create role Trainees;
	Revoke all on all tables in schema public from Trainees;
	grant select,delete,update on all tables in schema public to Trainees;
