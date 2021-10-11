drop procedure if exists `mysqldoc_tables`;
delimiter $$
create procedure mysqldoc_tables(
    in diagrams boolean
)
begin

    declare _table_cursor_finished int default 0;
    declare _tname, _engine varchar(64);
    declare _table_rows, _avg_row_length, _data_length, _index_length bigint(21);
    declare _create_time, _update_time datetime;
    declare _table_collation varchar(32);
    declare _table_comment varchar(2048);


    declare table_cursor cursor for select table_name, engine, table_rows, avg_row_length,
                                           data_length, index_length, create_time, update_time,
                                           table_collation, table_comment
                                    from information_schema.tables
                                    where table_schema = database()
                                      and table_type = 'BASE TABLE'
                                      and table_name not in ('mysqldoc_temp_docs', 'mysqldoc_temp_table');

    declare continue handler for not found set _table_cursor_finished = 1;

    open table_cursor;

    tableloop:
    loop
        fetch table_cursor into _tname, _engine, _table_rows, _avg_row_length,
            _data_length, _index_length, _create_time, _update_time, _table_collation, _table_comment;
        if _table_cursor_finished = 1 then leave tableloop; end if;

        call mysqldoc_line('table', _tname, '[index.md](index.md)');
        call mysqldoc_line('table', _tname, concat('# Table: ', _tname));

        if _table_comment <> '' then call mysqldoc_line('table', _tname, concat('>', _table_comment)); end if;

        if diagrams = 1 then
            delete from mysqldoc_temp_table;
            insert into mysqldoc_temp_table (id, table_name) values (1, _tname);
            -- diagram
            call mysqldoc_mermaid(_tname);
        end if;

        call mysqldoc_line('table', _tname, '');

        -- properties
        call mysqldoc_line('table', _tname, '## Properties');
        call mysqldoc_line('table', _tname, '| Property | Value |');
        call mysqldoc_line('table', _tname, '| ---- | ------- |');
        call mysqldoc_line('table', _tname, concat('| Engine | ', _engine));
        call mysqldoc_line('table', _tname, concat('| Rows | ', _table_rows));
        call mysqldoc_line('table', _tname, concat('| Average Row Length | ', _avg_row_length));
        call mysqldoc_line('table', _tname, concat('| Data Length | ', _data_length));
        call mysqldoc_line('table', _tname, concat('| Index Length | ', _index_length));
        call mysqldoc_line('table', _tname, concat('| Created | ', _create_time));
        call mysqldoc_line('table', _tname, concat('| Last Update | ', ifnull(_update_time, '-')));
        call mysqldoc_line('table', _tname, concat('| Collation | ', _table_collation));

        -- columns
        call mysqldoc_line('table', _tname, '## Columns');
        call mysqldoc_line('table', _tname, '');

        call mysqldoc_line('table', _tname, '| Key  | Column | Type        | Default | Nullable | Comment |');
        call mysqldoc_line('table', _tname, '| ---- | ------ | ----------- | ------- | -------- | ------- |');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'table'                                                                                 as type,
               _tname                                                                                   as name,
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
          and c.TABLE_NAME = _tname
        order by c.ORDINAL_POSITION;

        -- foreign keys
        call mysqldoc_foreign_keys(_tname);

        -- indexes
        call mysqldoc_indexes(_tname);

        -- triggers
        call mysqldoc_triggers(_tname);


    end loop tableloop;
    close table_cursor;

end$$

delimiter ;