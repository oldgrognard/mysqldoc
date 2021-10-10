drop procedure if exists `mysqldoc_views`;
delimiter $$
create procedure mysqldoc_views()
begin

    declare view_cursor_finished int default 0;
    declare _vname varchar(64);
    declare _body longtext;

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
        fetch view_cursor into _vname, _body;
        if view_cursor_finished = 1 then leave viewloop; end if;

        call mysqldoc_line('view', _vname, '[index.md](index.md)');
        call mysqldoc_line('view', _vname, concat('# View: ', _vname));

        call mysqldoc_line('view', _vname, '');

        -- properties
        call mysqldoc_view_properties(_vname);

        -- columns
        call mysqldoc_line('view', _vname, '## Columns');
        call mysqldoc_line('view', _vname, '');

        call mysqldoc_line('view', _vname, '| Column | Type        | Nullable |');
        call mysqldoc_line('view', _vname, '| ------ | ----------- | -------- | ');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'view',
               _vname,
               concat('| ', c.column_name, ' | ', c.column_type, ' | ',
                      if(c.is_nullable = 'YES', '&#x2705;', '&#x274C;'), ' |')
        from information_schema.COLUMNS c
        where c.TABLE_SCHEMA = database()
          and c.TABLE_NAME = _vname
        order by c.ORDINAL_POSITION;

        call mysqldoc_line('view', _vname, '## Definition');

        call mysqldoc_line('view', _vname, '');
        call mysqldoc_line('view', _vname, '```sql');
        call mysqldoc_line('view', _vname, replace(_body, '\n', '\r'));
        call mysqldoc_line('table', _vname, '```');

    end loop viewloop;
    close view_cursor;

end$$

delimiter ;