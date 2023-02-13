-- ######################## question2 ##################

drop table  if exists sal_emp;
create table sal_emp(
   Name varchar(25) Not null,
   jan int default 0,
   feb int default 0,
   mar int default 0,
   primary key ( name)
);
desc sal_emp;
insert into sal_emp values
( 'X',5200,9093,3832),
( 'Y',9023,8942,4000),
( 'Z',9834,8197,9903),
( 'W',3244,4321,0293);
select * from sal_emp;
drop function if exists month_;
delimiter $$
  create function month_(val int,jan int, feb int,mar int)
  returns varchar(10) deterministic
  begin 
    if val=jan then 
      return 'jan';
	elseif val=feb then
      return 'feb';
	else
      return 'mar';
	end if;
 end $$
delimiter ;

drop procedure if exists month_great;
delimiter $$
create procedure month_great()
begin
select name,greatest(jan,feb,mar) as Value, 
month_(greatest(jan,feb,mar),jan,feb,mar) as month  from sal_emp;
end $$

call month_great();
