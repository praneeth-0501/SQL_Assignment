-- ####################### question 3 ####################

drop table if exists can_test;
create table can_test(
 candidate_id int not null,
 marks int not null,
 primary key (candidate_id)
);

desc can_test;

insert into can_test values
(1,98),(2,78),(3,87),(4,98),(5,78);

select * from can_test;

drop procedure if exists marks_rank;

delimiter $$
create procedure marks_rank()
begin
select marks, dense_rank() over (order by marks desc) as 'Rank',
group_concat(candidate_id) as  candidate_id from can_test 
group by marks;
end $$
delimiter ;
call marks_rank();
