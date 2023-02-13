# SQL_Assignment

Initially, database is created by using create schema command.
### question 1:-
1. Create table by using DDL create table command. Before creating table dropping a table if there is any table with that name.
```
drop table if exists employees;

create table employees (
  EmpID int,
  Name varchar(20) not null,
  Gender varchar(20) not null,
  Department varchar(20) not null,
  check(Gender = 'Male' or Gender='Female'),
  primary key (EmpID)
);
```
2. By using desc command we can know properties of the table.
```
desc employees;
```
<img width="450" alt="Screenshot 2023-02-13 at 12 05 21 PM" src="https://user-images.githubusercontent.com/123532043/218387667-75439e61-a332-4f8c-a669-18cfcb78fb11.png">
3. Now 4 rows are inserting by using insert into command.

```
insert into employees
values (1,'X','Female','Finance'),
(2,'Y','Male','IT'),
(3,'Z','Male','HR'),
(4,'W','Female','IT');
```

```
select * from employees;
```
<img width="253" alt="Screenshot 2023-02-13 at 12 07 44 PM" src="https://user-images.githubusercontent.com/123532043/218388020-23208b35-1079-4ec1-aff7-9ebf13570650.png">

5. Here, we need create a query for number of male and female employees in each department. For this 3 columns should be present.
  1. Query is written in procedure for efficient and multiple timies using.
  2. First group all rows based on the department.
  3. Select department and for getting number of male employees and female employees in each department here case conditional statement and count function is used.
  4. Then ordered the final result based on department.
 ```
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
 ```
 <img width="327" alt="Screenshot 2023-02-13 at 12 20 06 PM" src="https://user-images.githubusercontent.com/123532043/218390021-7e9c72de-3583-4fd5-96b6-25f69204d593.png">

### question 2:-
1. Create table by using DDL create table command. Before creating table dropping a table if there is any table with that name.
```
drop table  if exists sal_emp;
create table sal_emp(
   Name varchar(25) Not null,
   jan int default 0,
   feb int default 0,
   mar int default 0,
   primary key ( name)
);
```
3. By using desc command we can know properties of the table.
```
desc sal_emp;
```
<img width="333" alt="Screenshot 2023-02-13 at 1 59 43 PM" src="https://user-images.githubusercontent.com/123532043/218408069-9dc29908-52c4-4267-afc6-f9230ac5de55.png">

4. Inserting rows into a table using insert into command.
```insert into sal_emp values
( 'X',5200,9093,3832),
( 'Y',9023,8942,4000),
( 'Z',9834,8197,9903),
( 'W',3244,4321,0293);
```
```
select * from sal_emp;
```
<img width="258" alt="Screenshot 2023-02-13 at 2 01 00 PM" src="https://user-images.githubusercontent.com/123532043/218408309-6d51e114-59b5-45b7-b348-1b1a2e54d876.png">

5. Creating function to find month name with maximum salary.
```
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
```
6. Creating procedure for using query multiple time easily. Drop procedure if exist.
```
drop procedure if exists month_great;
delimiter $$
create procedure month_great()
begin
select name,greatest(jan,feb,mar) as Value, 
month_(greatest(jan,feb,mar),jan,feb,mar) as month  from sal_emp;
end $$
```
7. we selected name, for getting maximum salary from 3 months here we used greatest function. For getting month with maximum salary we created a function named month_ using conditional if statments.
```
call month_great();
```
<img width="331" alt="Screenshot 2023-02-13 at 2 06 21 PM" src="https://user-images.githubusercontent.com/123532043/218409424-8309a6ad-e389-414b-8b57-735b9927b024.png">

### question 3 :
1. Create table by using DDL create table command. Before creating table dropping a table if there is any table with that name.
```
drop table if exists can_test;
create table can_test(
 candidate_id int not null,
 marks int not null,
 primary key (candidate_id)
);
```
2. By using desc command we can know properties of the table.
```
desc can_test;
```
<img width="384" alt="Screenshot 2023-02-13 at 2 14 13 PM" src="https://user-images.githubusercontent.com/123532043/218411086-94c71e79-a960-47cf-936e-f7e41f63b217.png">

3. Inserting rows.
```
insert into can_test values
(1,98),(2,78),(3,87),(4,98),(5,78);
```
```
select * from can_test;
```
<img width="322" alt="Screenshot 2023-02-13 at 2 14 53 PM" src="https://user-images.githubusercontent.com/123532043/218411235-fdb28bce-be72-43c4-a311-e744bb9fd414.png">
4. Creating procedure for using query multiple time easily. Drop procedure if exist.
```
create procedure marks_rank()
begin
select marks, dense_rank() over (order by marks desc) as 'Rank',
group_concat(candidate_id) as  candidate_id from can_test 
group by marks;
end $$
delimiter ;
```
5. For creating a nrank column here I USED DENSE_RANK() gives rank over marks obtained in descending order.
6. GROUP_CONCAT() is used to concat all the elements present in that group.
```
call marks_rank();
```
<img width="200" alt="Screenshot 2023-02-13 at 2 18 50 PM" src="https://user-images.githubusercontent.com/123532043/218412110-ba66e4a6-e9e8-4b17-ab0d-238acab5ff06.png">


### Question 4:-
1. Create table by using DDL create table command. Before creating table dropping a table if there is any table with that name.
```
drop table if exists repeated;
create table repeated (
   candidate_id int not null,
   email varchar(30)
);
```
2. By using desc command we can know properties of the table.
```
desc repeated;
```
<img width="352" alt="Screenshot 2023-02-13 at 2 29 57 PM" src="https://user-images.githubusercontent.com/123532043/218414604-ff3c0918-9f6d-4930-b38d-006604239097.png">

3. Inserting rows into table repeated.
```
insert into repeated 
values (45,'abc@gmail.com'),
 (23,'def@yahoo.com'),
 (34, 'abc@gmail.com'),
 (21, 'bcf@gmail.com'),
 (94, 'def@yahoo.com');
```
```
select * from repeated;
```
<img width="342" alt="Screenshot 2023-02-13 at 2 30 25 PM" src="https://user-images.githubusercontent.com/123532043/218414696-081b1cda-60ef-430f-9768-ecec426749ac.png">

4. First here I'm creating a select query to select rows not to be deleted using sub quries.
```
 select min(Candidate_id)  as candidate_id, email
 from repeated
 group by email;
```
<img width="280" alt="Screenshot 2023-02-13 at 2 33 23 PM" src="https://user-images.githubusercontent.com/123532043/218415298-bd46f4b3-e5d1-4c95-9329-7d0e2048a75b.png">

5. Here minimum candidate_id selected from groups which are grouped by email.
6. Procedure is created for deleting row.
```
drop procedure if exists del_row;
 
 delimiter $$
 create procedure del_row()
 begin
 delete from repeated 
 where  repeated.candidate_id not in (select * from(select min(Candidate_id)
 from repeated 
 group by email ) temp1);

end $$
delimiter ;
```
7. Calling procedure.
```
call del_row();
```
8. Final Table.
```
select * from repeated
 order by candidate_id desc;
```
<img width="208" alt="Screenshot 2023-02-13 at 2 35 51 PM" src="https://user-images.githubusercontent.com/123532043/218415845-38362e25-00ae-4155-ba15-afc812819ef9.png">

