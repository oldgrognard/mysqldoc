drop procedure if exists `mysqldoc_table_properties`;
delimiter $$
create procedure mysqldoc_table_properties(
    in tname varchar(64)
)
begin

    call mysqldoc_line('table', tname, '');

    call mysqldoc_line('table', tname, '## Properties');
    call mysqldoc_line('table', tname, '| Property | Value |');
    call mysqldoc_line('table', tname, '| ---- | ------- |');

    insert into tmp_docs (type, name, line)
    select 'table', tname, concat('| Engine | ', engine, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Collation | ', TABLE_COLLATION, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Row Count | ', table_rows, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Average Row Length | ', AVG_ROW_LENGTH, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Index Length | ', INDEX_LENGTH, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Created | ', CREATE_TIME, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Updated | ', ifnull(UPDATE_TIME,'-'), ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname;

end$$

delimiter ;