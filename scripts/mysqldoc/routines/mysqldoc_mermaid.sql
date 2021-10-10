drop procedure if exists `mysqldoc_mermaid`;
delimiter $$
create procedure mysqldoc_mermaid(
    in tname varchar(200)
)
begin
    declare mermaid_cursor_done int default 0;
    declare fk_table varchar(64);
    declare mermaid_cursor cursor for select table_name as fk_table
                                      from mysqldoc_temp_table
                                      where id = 1
                                      union
                                      select REFERENCED_TABLE_NAME as fk_table
                                      from information_schema.KEY_COLUMN_USAGE k
                                               join mysqldoc_temp_table tt on k.TABLE_NAME = tt.table_name
                                      where CONSTRAINT_SCHEMA = database()
                                        and REFERENCED_TABLE_NAME is not null
                                      union
                                      select k.TABLE_NAME as fk_table
                                      from information_schema.KEY_COLUMN_USAGE k
                                               join mysqldoc_temp_table tt2 on k.REFERENCED_TABLE_NAME = tt2.table_name
                                      where CONSTRAINT_SCHEMA = database()
                                        and REFERENCED_TABLE_NAME is not null;
    declare continue handler for not found set mermaid_cursor_done = true;

    set @key_count = ( select count(*)
                     from information_schema.KEY_COLUMN_USAGE
                     where table_schema = database() and TABLE_NAME = tname and REFERENCED_TABLE_NAME is not null and
                           table_name = tname
                        or REFERENCED_TABLE_NAME = tname );

    call mysqldoc_line('table', tname, '```mermaid');
    call mysqldoc_line('table', tname,
                     '%%{init: {\'theme\': \'base\', \'themeVariables\': {\'darkMode\': false, \'mainBkg\': \'#cfc\',\'primaryBorderColor\': \'#696\',\'primaryTextColor\': \'#353\',\'lineColor\': \'#787\'}}}%%');

    call mysqldoc_line('table', tname, '   erDiagram');
    if @key_count = 0 then
        call mysqldoc_line('table', tname, concat('   ', tname));
        call mysqldoc_line('table', tname, concat('   ', tname, '   {'));

        insert into mysqldoc_temp_docs (type, name, line)
        select 'table', tname, concat('      ', DATA_TYPE, ' ', COLUMN_NAME)
        from information_schema.COLUMNS
        where TABLE_SCHEMA = database()
          and TABLE_NAME = tname
        order by ORDINAL_POSITION;

        call mysqldoc_line('table', tname, '   }');
    else
        insert into mysqldoc_temp_docs (type, name, line)
        select 'table', tname, concat(table_name, ' }|--|| ', REFERENCED_TABLE_NAME, ' : ""')
        from information_schema.KEY_COLUMN_USAGE
        where table_schema = database()
          and REFERENCED_TABLE_NAME is not null
          and (table_name = tname or REFERENCED_TABLE_NAME = tname);

        open mermaid_cursor;
        mermaid_loop:
        loop
            fetch mermaid_cursor into fk_table;
            if mermaid_cursor_done = 1 then leave mermaid_loop; end if;

            call mysqldoc_line('table', tname, fk_table);
            call mysqldoc_line('table', tname, concat(fk_table, ' {'));

            insert into mysqldoc_temp_docs (type, name, line)
            select 'table', tname, concat('      ', DATA_TYPE, ' ', COLUMN_NAME)
            from information_schema.COLUMNS
            where TABLE_SCHEMA = database()
              and TABLE_NAME = fk_table
            order by ORDINAL_POSITION;

            call mysqldoc_line('table', tname, '}');
        end loop mermaid_loop;
        close mermaid_cursor;
    end if;
    call mysqldoc_line('table', tname, '```');
end
$$

delimiter ;