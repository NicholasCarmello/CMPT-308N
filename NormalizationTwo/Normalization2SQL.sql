create table people(
	pid      int  primary key,
	firstname varchar(20) not null,
	lastname  varchar(20) not null,
	address varchar(50) not null,
	spouseFirstName varchar(50),
	spouseLastName varchar(50),
	favoriteColor varchar (50) ,
	weight varchar(10) not null,
	HeightInches varchar(3)not null,
	eyecolor varchar(20)not null,
	birthdate date not null,
	hairColor varchar(10) not null
);

create table actors (
	pid int,
	screenActorGuildDate   date,
	foreign key(pid) references people(pid),
	primary key(pid)
);


create table directors(
	pid int,
	filmSchoolAttended varchar(50),
	directorsGuildAnniversary   Date,
	favoriteLensMaker   varchar (50),
	foreign key(pid) references people(pid),
	primary key(pid)

);

create table Movie(
pid     int,
title   varchar (50),
yearReleased   int,
MPAaNumber     char(5),
domesticBoxOfficeSales int,
foreignBoxOfficeSales int,
DvdAndBlueRaySales int,
	primary key(pid)
);

create table movieActor(
MoviePid int references Movie(pid),
ActorPid int references actors(pid)
	  
);


create table movieDirector (
	MoviePid int references Movie(pid),
	DirectorPid int references Directors(pid)
);


--Correct
select firstname, lastname
from people
where pid in (
select DirectorPid 
from movieDirector
where MoviePid in (
	select MoviePid
	from movieActor
	where ActorPid in (
						select pid
						from people
						where firstname = 'Roger' and lastname = 'Moore'
						))
);




