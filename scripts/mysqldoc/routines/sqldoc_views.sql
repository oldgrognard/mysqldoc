drop procedure if exists `sqldoc_views`;
delimiter $$
create procedure sqldoc_views()
begin

    declare view_cursor_finished int default 0;
    declare vname varchar(64);
    declare v_body longtext;

    declare view_cursor cursor for select t.table_name, v.VIEW_DEFINITION
                                   from information_schema.tables t
                                            join information_schema.VIEWS v
                                                 on t.TABLE_SCHEMA = v.TABLE_SCHEMA and t.TABLE_NAME = v.TABLE_NAME
                                   where table_type = 'VIEW'
                                     and t.TABLE_SCHEMA = database();

    declare continue handler for not found set view_cursor_finished = 1;

    open view_cursor;

    viewloop:
    loop
        fetch view_cursor into vname, v_body;
        if view_cursor_finished = 1 then leave viewloop; end if;

        call sqldoc_line('view', vname, '[index.md](index.md)');
        call sqldoc_line('view', vname, concat('# View: ', vname));

        call sqldoc_line('view', vname, '');

        -- properties
        call sqldoc_view_properties(vname);

        -- columns
        call sqldoc_line('view', vname, '## Columns');
        call sqldoc_line('view', vname, '');

        call sqldoc_line('view', vname, '| Column | Type        | Nullable |');
        call sqldoc_line('view', vname, '| ------ | ----------- | -------- | ');

        insert into tmp_docs (type, name, line)
        select 'view'                                                         as type,
               vname                                                          as name,
               concat('| ', c.column_name, ' | ', c.column_type, ' | ',
                      if(c.is_nullable = 'NO', '&#128683;', '&#9989;'), ' |') as line
        from information_schema.COLUMNS c
        where c.TABLE_SCHEMA = database()
          and c.TABLE_NAME = vname
        order by c.ORDINAL_POSITION;

        call sqldoc_line('view', vname, '## Definition');

        call sqldoc_line('view', vname, '');
        call sqldoc_line('view', vname, '```sql');
        call sqldoc_line('view', vname, replace(v_body, '\n', '\r'));
        call sqldoc_line('table', vname, '```');

    end loop viewloop;
    close view_cursor;

end$$

delimiter ;