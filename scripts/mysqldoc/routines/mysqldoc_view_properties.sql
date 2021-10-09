drop procedure if exists `mysqldoc_view_properties`;
delimiter $$
create procedure mysqldoc_view_properties(
    in vname varchar(64)
)
begin

    call mysqldoc_line('view', vname, '');

    call mysqldoc_line('view', vname, '## Properties');
    call mysqldoc_line('view', vname, '| Property | Value |');
    call mysqldoc_line('view', vname, '| ---- | ------- |');

    insert into mysqldoc_temp_docs (type, name, line)
    select 'view', vname, concat('| Updatable | ', IS_UPDATABLE, ' |') as line
    from information_schema.VIEWS
    where TABLE_SCHEMA = database()
      and TABLE_NAME = vname
    union
    select 'view', vname, concat('| Definer | ', DEFINER, ' |') as line
    from information_schema.VIEWS
    where TABLE_SCHEMA = database()
      and TABLE_NAME = vname
    union
    select 'view', vname, concat('| Character Set | ', CHARACTER_SET_CLIENT, ' |') as line
    from information_schema.VIEWS
    where TABLE_SCHEMA = database()
      and TABLE_NAME = vname
    union
    select 'view', vname, concat('| Collation | ', COLLATION_CONNECTION, ' |') as line
    from information_schema.VIEWS
    where TABLE_SCHEMA = database()
      and TABLE_NAME = vname;

end$$

delimiter ;