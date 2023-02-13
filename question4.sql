-- ##########################  question4 ####################################
drop table if exists repeated;
create table repeated (
   candidate_id int not null,
   email varchar(30)
);
desc repeated;
insert into repeated 
values (45,'abc@gmail.com'),
 (23,'def@yahoo.com'),
 (34, 'abc@gmail.com'),
 (21, 'bcf@gmail.com'),
 (94, 'def@yahoo.com');
 select * from repeated;
 select min(Candidate_id)  as candidate_id, email
 from repeated
 group by email;
 
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

call del_row();

 select * from repeated
 order by candidate_id desc;

