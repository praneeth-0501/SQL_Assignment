-- ###################### question1 ###################################
drop table if exists employees;
create table employees (
  EmpID int,
  Name varchar(20) not null,
  Gender varchar(20) not null,
  Department varchar(20) not null,
  check(Gender = 'Male' or Gender='Female'),
  primary key (EmpID)
);
desc employees;
insert into employees values(5,'A','Ntg','student');
insert into employees
values (1,'X','Female','Finance'),
(2,'Y','Male','IT'),
(3,'Z','Male','HR'),
(4,'W','Female','IT');

select * from employees;
drop procedure if exists num_male_female;
delimiter $$
create procedure num_male_female()
begin
select department,
   count(case gender when 'male' then 1 end) as 'Num of male',
   count(case gender when 'female' then 1 end) as 'Num of female'
   from employees
group by department
order by department;
end $$
delimiter ;
call num_male_female();
