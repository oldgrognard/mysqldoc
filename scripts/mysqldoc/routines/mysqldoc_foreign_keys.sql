drop procedure if exists `mysqldoc_foreign_keys`;
delimiter $$
create procedure mysqldoc_foreign_keys(
    in tname varchar(200)
)
begin
    set @foreign_key_count = (select count(*)
                             from information_schema.TABLE_CONSTRAINTS
                             where CONSTRAINT_TYPE = 'FOREIGN KEY'
                               and table_schema = database()
                               and table_name = tname);

    if @foreign_key_count > 0 then
        call mysqldoc_line('table', tname, '');

        call mysqldoc_line('table', tname, '## Foreign Keys');
        call mysqldoc_line('table', tname, '| Name | Columns | Update Rule | Delete Rule |');
        call mysqldoc_line('table', tname, '| ---- | ------- | ----------- | ----------- |');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'table',
               tname,
               concat('| ', tc.constraint_name, ' | ', group_concat(
                       concat(k.column_name, ' --> ', k.REFERENCED_TABLE_NAME, '.', k.REFERENCED_COLUMN_NAME) separator
                       ', '), ' | ', rc.update_rule, ' | ', rc.delete_rule, ' |')
        from information_schema.TABLE_CONSTRAINTS tc
                 join information_schema.KEY_COLUMN_USAGE k on tc.CONSTRAINT_NAME = k.CONSTRAINT_NAME
                 join information_schema.REFERENTIAL_CONSTRAINTS rc
                      on tc.CONSTRAINT_SCHEMA = rc.CONSTRAINT_SCHEMA and tc.CONSTRAINT_NAME = rc.CONSTRAINT_NAME
        where tc.TABLE_SCHEMA = database()
          and tc.TABLE_NAME = tname
          and CONSTRAINT_TYPE = 'FOREIGN KEY'
        group by tc.constraint_name, k.TABLE_NAME, rc.UPDATE_RULE, rc.DELETE_RULE;

    end if;
end$$

delimiter ;
