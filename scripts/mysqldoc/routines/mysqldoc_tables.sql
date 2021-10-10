drop procedure if exists `mysqldoc_tables`;
delimiter $$
create procedure mysqldoc_tables(
    in diagrams boolean
)
begin

    declare table_cursor_finished int default 0;
    declare tname varchar(64);
    declare tcomment varchar(2048);

    declare table_cursor cursor for select table_name, table_comment
                                    from information_schema.tables
                                    where table_schema = database()
                                      and table_type = 'BASE TABLE'
                                      and table_name not in ('mysqldoc_temp_docs', 'mysqldoc_temp_table');

    declare continue handler for not found set table_cursor_finished = 1;

    open table_cursor;

    tableloop:
    loop
        fetch table_cursor into tname, tcomment;
        if table_cursor_finished = 1 then leave tableloop; end if;

        call mysqldoc_line('table', tname, '[index.md](index.md)');
        call mysqldoc_line('table', tname, concat('# Table: ', tname));

        if tcomment <> '' then call mysqldoc_line('table', tname, concat('>', tcomment)); end if;

        if diagrams = 1 then
            delete from mysqldoc_temp_table;
            insert into mysqldoc_temp_table (id, table_name) values (1, tname);
            -- diagram
            call mysqldoc_mermaid(tname);
        end if;

        call mysqldoc_line('table', tname, '');

        -- properties
        call mysqldoc_table_properties(tname);

        -- columns
        call mysqldoc_line('table', tname, '## Columns');
        call mysqldoc_line('table', tname, '');

        call mysqldoc_line('table', tname, '| Key  | Column | Type        | Default | Nullable | Comment |');
        call mysqldoc_line('table', tname, '| ---- | ------ | ----------- | ------- | -------- | ------- |');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'table'                                                                                 as type,
               tname                                                                                   as name,
               concat('| ', ifnull(( select if(kc.ORDINAL_POSITION is null, '', '&#128273;')
                                     from information_schema.KEY_COLUMN_USAGE kc
                                     where c.TABLE_SCHEMA = kc.TABLE_SCHEMA
                                       and c.TABLE_NAME = kc.TABLE_NAME
                                       and c.COLUMN_NAME = kc.COLUMN_NAME
                                       and kc.CONSTRAINT_NAME = 'PRIMARY' ), ''), ' ',
                      ifnull(( select distinct if(kc.COLUMN_NAME is null, '', '&#128477;')
                               from information_schema.KEY_COLUMN_USAGE kc
                               where c.TABLE_SCHEMA = kc.TABLE_SCHEMA
                                 and c.TABLE_NAME = kc.TABLE_NAME
                                 and c.COLUMN_NAME = kc.COLUMN_NAME
                                 and kc.referenced_table_schema <> 'null'
                                 and kc.CONSTRAINT_NAME <> 'PRIMARY' ), ''), ' | ', c.column_name, ' | ', c.column_type,
                      ' | ', if(c.column_default = '', 'empty string', ifnull(c.column_default, '')), ' | ',
                      mysqldoc_yn(c.is_nullable), ' | ', c.column_comment, ' |') as line
        from information_schema.COLUMNS c
        where c.TABLE_SCHEMA = database()
          and c.TABLE_NAME = tname
        order by c.ORDINAL_POSITION;

        -- foreign keys
        call mysqldoc_foreign_keys(tname);

        -- indexes
        call mysqldoc_indexes(tname);

        -- triggers
        call mysqldoc_triggers(tname);


    end loop tableloop;
    close table_cursor;

end$$

delimiter ;