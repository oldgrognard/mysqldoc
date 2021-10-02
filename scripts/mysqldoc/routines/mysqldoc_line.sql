drop procedure if exists `mysqldoc_line`;
delimiter $$
create procedure mysqldoc_line(
in type varchar(100),
in name varchar(200),
in line varchar(4000)
)
begin
    insert into tmp_docs (type, name, line) values (type, name, line);
end $$

delimiter ;