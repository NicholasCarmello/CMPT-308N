
create or replace function GetCourseNumber(int, REFCURSOR) returns refcursor as
$$
declare
	prereq int := $1;
	resultset REFCURSOR := $2;

begin
	open resultset for 
		select coursenum
		from prerequisites
		where prereqnum = prereq;
	return resultset;
end;
$$
language plpgsql;

select getCourseNumber(120,'results');
Fetch all from results;



create or replace function GetPrerequisite(int, REFCURSOR) returns refcursor as
$$
declare
	course int := $1;
	resultset REFCURSOR := $2;

begin
	open resultset for 
		select prereqnum
		from prerequisites
		where courseNum = course;
	return resultset;
end;
$$
language plpgsql;

select getPrerequisite(499,'results');
Fetch all from results;

