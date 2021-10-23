drop procedure if exists `mysqldoc_main`;
delimiter $$
create procedure mysqldoc_main(
    in export boolean,
    in diagrams boolean,
    in path varchar(500)
)
begin
    set path = ifnull(path, '/var/lib/mysql-files/');

    drop table if exists mysqldoc_temp_docs;
    drop table if exists mysqldoc_temp_table;

    create table mysqldoc_temp_docs
    (
        id   int auto_increment,
        type varchar(100) not null         default 'toc',
        name varchar(200) not null         default 'toc',
        line longtext charset utf8mb4 null,
        constraint mysqldoc_temp_docs_pk primary key (id)
    );

    create table mysqldoc_temp_table
    (
        id         int         not null default 1,
        table_name varchar(64) not null default ''
    );

    -- Table of Contents
    insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', concat('# DATABASE: ', database()));
    insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', '__Data Dictionary__');
    insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', '## Table of Contents');
    insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', '### Tables');
    insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', '| Name | Comment | Row Count|');
    insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', '| ---- | ------- | ---------: |');

    insert into mysqldoc_temp_docs (type, name, line)
    select 'toc',
           'toc',
           concat('| [', table_name, '](table_', table_name, '.md) | ', table_comment, ' | ', table_rows, ' |')
    from information_schema.tables
    where table_schema = database()
      and table_type = 'BASE TABLE'
      and table_name not in ('mysqldoc_temp_docs', 'mysqldoc_temp_table');

    -- toc views
    set @view_count = ( select count(*) as num
                        from information_schema.tables t
                                 join information_schema.VIEWS v
                                      on t.TABLE_SCHEMA = v.TABLE_SCHEMA and t.TABLE_NAME = v.TABLE_NAME
                        where table_type = 'VIEW'
                          and t.TABLE_SCHEMA = database() );

    if @view_count > 0 then

        insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', '### Views ');
        insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', '| Name | Updatable | Definer |');
        insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', '| ---- |:---------:| ------- |');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'toc',
               'toc',
               concat('| [', t.TABLE_NAME, '](view_', t.table_name, '.md) | ',
                      if(v.IS_UPDATABLE = 'YES', '&#x2705;', '&#x274C;'), ' | ', v.DEFINER, ' |')
        from information_schema.TABLES t
                 join information_schema.VIEWS v on t.TABLE_SCHEMA = v.TABLE_SCHEMA and t.TABLE_NAME = v.TABLE_NAME
        where t.table_schema = database()
          and table_type = 'VIEW';
    end if;

    -- toc stored procedures
    set @proc_count = ( select count(*)
                        from information_schema.routines r
                        where routine_schema = database()
                          and routine_type = 'PROCEDURE'
                          and routine_name not like 'mysqldoc_%' );

    if @proc_count > 0 then
        insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', '### Stored Procedures');
        insert into mysqldoc_temp_docs (type, name, line)
        values ('toc', 'toc', '| Name | Deterministic | Data Access | Definer | Comment |');
        insert into mysqldoc_temp_docs (type, name, line)
        values ('toc', 'toc', '| ---- | ------------- | ----------- | ------- | ------- |');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'toc',
               'toc',
               concat('| [', ROUTINE_NAME, '](procedure_', ROUTINE_NAME, '.md)', ' | ',
                      if(IS_DETERMINISTIC = 'YES', '&#x2705;', '&#x274C;'), ' | ', SQL_DATA_ACCESS, ' | ', DEFINER, ' | ',
                      ROUTINE_COMMENT, ' |')
        from information_schema.routines r
        where routine_schema = database()
          and routine_type = 'PROCEDURE'
          and routine_name not like 'mysqldoc_%'
        order by r.routine_name;


    end if;

    -- toc functions
    set @func_count = ( select count(*)
                        from information_schema.routines r
                        where routine_schema = database()
                          and routine_type = 'FUNCTION'
                          and routine_name not like 'mysqldoc_%' );

    if @func_count > 0 then
        insert into mysqldoc_temp_docs (type, name, line) values ('toc', 'toc', '### Functions');
        insert into mysqldoc_temp_docs (type, name, line)
        values ('toc', 'toc', '| Name | Deterministic | Data Access | Definer | Return Type |');
        insert into mysqldoc_temp_docs (type, name, line)
        values ('toc', 'toc', '| ---- | ------------- | ----------- | ------- | ----------- |');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'toc',
               'toc',
               concat('| [', ROUTINE_NAME, '](function_', ROUTINE_NAME, '.md)', ' | ',
                      if(IS_DETERMINISTIC = 'YES', '&#x2705;', '&#x274C;'), ' | ', SQL_DATA_ACCESS, ' | ', DEFINER, ' | ',
                      DTD_IDENTIFIER, ' |')
        from information_schema.routines r
        where routine_schema = database()
          and routine_type = 'FUNCTION'
          and routine_name not like 'mysqldoc_%'
        order by r.routine_name;

    end if;

    -- end table of contents

    -- tables
    -- call mysqldoc_tables(diagrams);
    table_block:
    begin
        declare _table_cursor_finished int default 0;
        declare _tname, _engine varchar(64);
        declare _table_rows, _avg_row_length, _data_length, _index_length bigint(21);
        declare _create_time, _update_time datetime;
        declare _table_collation varchar(32);
        declare _table_comment varchar(2048);


        declare table_cursor cursor for select table_name,
                                               engine,
                                               table_rows,
                                               avg_row_length,
                                               data_length,
                                               index_length,
                                               create_time,
                                               update_time,
                                               table_collation,
                                               table_comment
                                        from information_schema.tables
                                        where table_schema = database()
                                          and table_type = 'BASE TABLE'
                                          and table_name not in ('mysqldoc_temp_docs', 'mysqldoc_temp_table');

        declare continue handler for not found set _table_cursor_finished = 1;

        open table_cursor;

        tableloop:
        loop
            fetch table_cursor into _tname, _engine, _table_rows, _avg_row_length, _data_length, _index_length, _create_time, _update_time, _table_collation, _table_comment;
            if _table_cursor_finished = 1 then leave tableloop; end if;

            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '[index.md](index.md)');
            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, concat('# Table: ', _tname));

            if _table_comment <> '' then
                insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, concat('>', _table_comment));
            end if;

            if diagrams = 1 then
                delete from mysqldoc_temp_table;
                insert into mysqldoc_temp_table (id, table_name) values (1, _tname);
                -- diagram
                -- call mysqldoc_mermaid(_tname);
                mermaid_block:
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
                                       where table_schema = database() and TABLE_NAME = _tname and
                                             REFERENCED_TABLE_NAME is not null and table_name = _tname
                                          or REFERENCED_TABLE_NAME = _tname );

                    insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '```mermaid');
                    insert into mysqldoc_temp_docs (type, name, line)
                    values ('table', _tname,
                            '%%{init: {\'theme\': \'base\', \'themeVariables\': {\'darkMode\': false, \'mainBkg\': \'#cfc\',\'primaryBorderColor\': \'#696\',\'primaryTextColor\': \'#353\',\'lineColor\': \'#787\'}}}%%');

                    insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '   erDiagram');
                    if @key_count = 0 then
                        insert into mysqldoc_temp_docs (type, name, line)
                        values ('table', _tname, concat('   ', _tname));
                        insert into mysqldoc_temp_docs (type, name, line)
                        values ('table', _tname, concat('   ', _tname, '   {'));

                        insert into mysqldoc_temp_docs (type, name, line)
                        select 'table', _tname, concat('      ', DATA_TYPE, ' ', COLUMN_NAME)
                        from information_schema.COLUMNS
                        where TABLE_SCHEMA = database()
                          and TABLE_NAME = _tname
                        order by ORDINAL_POSITION;

                        insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '   }');
                    else
                        insert into mysqldoc_temp_docs (type, name, line)
                        select 'table', _tname, concat(table_name, ' }|--|| ', REFERENCED_TABLE_NAME, ' : ""')
                        from information_schema.KEY_COLUMN_USAGE
                        where table_schema = database()
                          and REFERENCED_TABLE_NAME is not null
                          and (table_name = _tname or REFERENCED_TABLE_NAME = _tname);

                        open mermaid_cursor;
                        mermaid_loop:
                        loop
                            fetch mermaid_cursor into fk_table;
                            if mermaid_cursor_done = 1 then leave mermaid_loop; end if;

                            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, fk_table);
                            insert into mysqldoc_temp_docs (type, name, line)
                            values ('table', _tname, concat(fk_table, ' {'));

                            insert into mysqldoc_temp_docs (type, name, line)
                            select 'table', _tname, concat('      ', DATA_TYPE, ' ', COLUMN_NAME)
                            from information_schema.COLUMNS
                            where TABLE_SCHEMA = database()
                              and TABLE_NAME = fk_table
                            order by ORDINAL_POSITION;

                            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '}');
                        end loop mermaid_loop;
                        close mermaid_cursor;
                    end if;
                    insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '```');
                end mermaid_block;
            end if;

            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '');

            -- properties
            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '## Properties');
            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '| Property | Value |');
            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '| ---- | ------- |');
            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, concat('| Engine | ', _engine));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('table', _tname, concat('| Rows | ', _table_rows));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('table', _tname, concat('| Average Row Length | ', _avg_row_length));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('table', _tname, concat('| Data Length | ', _data_length));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('table', _tname, concat('| Index Length | ', _index_length));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('table', _tname, concat('| Created | ', _create_time));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('table', _tname, concat('| Last Update | ', ifnull(_update_time, '-')));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('table', _tname, concat('| Collation | ', _table_collation));

            -- columns
            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '## Columns');
            insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '');

            insert into mysqldoc_temp_docs (type, name, line)
            values ('table', _tname, '| Key  | Column | Type        | Default | Nullable | Comment |');
            insert into mysqldoc_temp_docs (type, name, line)
            values ('table', _tname, '| ---- | ------ | ----------- | ------- | -------- | ------- |');

            insert into mysqldoc_temp_docs (type, name, line)
            select 'table'                                                                                     as type,
                   _tname                                                                                      as name,
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
                                     and kc.CONSTRAINT_NAME <> 'PRIMARY' ), ''), ' | ', c.column_name, ' | ',
                          c.column_type, ' | ', if(c.column_default = '', 'empty string', ifnull(c.column_default, '')),
                          ' | ', if(c.IS_NULLABLE = 'YES', '&#x2705;', '&#x274C;'), ' | ', c.column_comment, ' |') as line
            from information_schema.COLUMNS c
            where c.TABLE_SCHEMA = database()
              and c.TABLE_NAME = _tname
            order by c.ORDINAL_POSITION;

            -- foreign keys
            set @foreign_key_count = ( select count(*)
                                       from information_schema.TABLE_CONSTRAINTS
                                       where CONSTRAINT_TYPE = 'FOREIGN KEY'
                                         and table_schema = database()
                                         and table_name = _tname );

            if @foreign_key_count > 0 then
                insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '');

                insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '## Foreign Keys');
                insert into mysqldoc_temp_docs (type, name, line)
                values ('table', _tname, '| Name | Columns | Update Rule | Delete Rule |');
                insert into mysqldoc_temp_docs (type, name, line)
                values ('table', _tname, '| ---- | ------- | ----------- | ----------- |');

                insert into mysqldoc_temp_docs (type, name, line)
                select 'table',
                       _tname,
                       concat('| ', tc.constraint_name, ' | ', group_concat(
                               concat(k.column_name, ' --> ', k.REFERENCED_TABLE_NAME, '.', k.REFERENCED_COLUMN_NAME)
                               separator ', '), ' | ', rc.update_rule, ' | ', rc.delete_rule, ' |')
                from information_schema.TABLE_CONSTRAINTS tc
                         join information_schema.KEY_COLUMN_USAGE k on tc.CONSTRAINT_NAME = k.CONSTRAINT_NAME
                         join information_schema.REFERENTIAL_CONSTRAINTS rc
                              on tc.CONSTRAINT_SCHEMA = rc.CONSTRAINT_SCHEMA and tc.CONSTRAINT_NAME = rc.CONSTRAINT_NAME
                where tc.TABLE_SCHEMA = database()
                  and tc.TABLE_NAME = _tname
                  and CONSTRAINT_TYPE = 'FOREIGN KEY'
                group by tc.constraint_name, k.TABLE_NAME, rc.UPDATE_RULE, rc.DELETE_RULE;

            end if;

            -- indexes
            set @index_count = ( select count(*)
                                 from information_schema.STATISTICS
                                 where table_schema = database() and table_name = _tname );

            if @index_count > 0 then

                insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '');

                insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '## Indexes');
                insert into mysqldoc_temp_docs (type, name, line)
                values ('table', _tname, '| Name | Columns | Unique | Full Text | Comment |');
                insert into mysqldoc_temp_docs (type, name, line)
                values ('table', _tname, '| ---- | ------- | ------ | --------- | ------- |');

                insert into mysqldoc_temp_docs (type, name, line)
                select 'table',
                       _tname,
                       concat('| ', index_name, ' | ',
                              group_concat(distinct column_name order by seq_in_index separator ', '), ' | ',
                              if(!NON_UNIQUE = 1, '&#x2705;', '&#x274C;'), ' | ',
                              if(INDEX_TYPE = 'FULLTEXT', '&#x2705;', '&#x274C;'), ' | ', index_comment, ' |')
                from information_schema.STATISTICS
                where TABLE_SCHEMA = database()
                  and TABLE_NAME = _tname
                group by index_name, NON_UNIQUE, INDEX_TYPE, INDEX_COMMENT
                order by NON_UNIQUE, index_name;

            end if;


            -- triggers
            -- call mysqldoc_triggers(_tname);
            trigger_block:
            begin
                declare _trigger_cursor_finished int default 0;
                declare _trigger_name varchar(64);
                declare _event_manipulation, _action_timing varchar(6);
                declare _action_statement longtext;
                declare _created datetime(2);
                declare _definer varchar(93);
                declare _character_set_client, _collation_connection varchar(32);

                declare trigger_cursor cursor for select TRIGGER_NAME,
                                                         ACTION_TIMING,
                                                         EVENT_MANIPULATION,
                                                         DEFINER,
                                                         CHARACTER_SET_CLIENT,
                                                         COLLATION_CONNECTION,
                                                         CREATED,
                                                         ACTION_STATEMENT
                                                  from information_schema.triggers
                                                  where EVENT_OBJECT_SCHEMA = database()
                                                    and EVENT_OBJECT_TABLE = _tname;

                declare continue handler for not found set _trigger_cursor_finished = 1;

                set @trigger_count =
                        ( select count(*) from information_schema.triggers where EVENT_OBJECT_SCHEMA = database()
                                                                             and EVENT_OBJECT_TABLE = _tname );

                if @trigger_count > 0 then

                    insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '');
                    insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '## Triggers');

                    open trigger_cursor;

                    triggerloop:
                    loop

                        fetch trigger_cursor into _trigger_name, _action_timing, _event_manipulation, _definer, _character_set_client, _collation_connection, _created, _action_statement;
                        if _trigger_cursor_finished = 1 then leave triggerloop; end if;

                        insert into mysqldoc_temp_docs (type, name, line)
                        values ('table', _tname, concat('### ', _trigger_name));

                        insert into mysqldoc_temp_docs (type, name, line)
                        values ('table', _tname,
                                '| Timing | Event | Definer | Character Set | Collation | Created |');
                        insert into mysqldoc_temp_docs (type, name, line)
                        values ('table', _tname,
                                '| ------ | ----- | ------- | ------------- | --------- | ------- |');

                        insert into mysqldoc_temp_docs (type, name, line)
                        select 'table',
                               _tname,
                               concat('| ', _action_timing, ' | ', _event_manipulation, ' | ', _definer, ' | ',
                                      _character_set_client, ' | ', _collation_connection, ' | ', _created, ' |');

                        insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '');
                        insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '```sql');
                        insert into mysqldoc_temp_docs (type, name, line)
                        values ('table', _tname, replace(_action_statement, '\n', '\r'));
                        insert into mysqldoc_temp_docs (type, name, line) values ('table', _tname, '```');

                    end loop triggerloop;
                    close trigger_cursor;

                end if;
            end trigger_block;


        end loop tableloop;
        close table_cursor;
    end table_block;

    -- end tables

    -- views
    -- call mysqldoc_views();
    view_block:
    begin
        declare view_cursor_finished int default 0;
        declare _vname varchar(64);
        declare _body longtext;
        declare _is_updatable varchar(3);
        declare _definer varchar(93);
        declare _security_type varchar(7);
        declare _character_set_client, _collation_connection varchar(32);

        declare view_cursor cursor for select t.TABLE_NAME,
                                              VIEW_DEFINITION,
                                              IS_UPDATABLE,
                                              DEFINER,
                                              SECURITY_TYPE,
                                              CHARACTER_SET_CLIENT,
                                              COLLATION_CONNECTION
                                       from information_schema.tables t
                                                join information_schema.VIEWS v
                                                     on t.TABLE_SCHEMA = v.TABLE_SCHEMA and t.TABLE_NAME = v.TABLE_NAME
                                       where table_type = 'VIEW'
                                         and t.TABLE_SCHEMA = database();

        declare continue handler for not found set view_cursor_finished = 1;

        open view_cursor;

        viewloop:
        loop
            fetch view_cursor into _vname, _body, _is_updatable, _definer, _security_type, _character_set_client, _collation_connection;
            if view_cursor_finished = 1 then leave viewloop; end if;

            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, '[index.md](index.md)');
            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, concat('# View: ', _vname));

            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, '');

            -- properties
            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, '## Properties');
            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, '| Property | Value |');
            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, '| ---- | ------- |');
            insert into mysqldoc_temp_docs (type, name, line)
            values ('view', _vname, concat('| Updatable | ', _is_updatable, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('view', _vname, concat('| Definer | ', _definer, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('view', _vname, concat('| Security Type | ', _security_type, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('view', _vname, concat('| Client Character Set | ', _character_set_client, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('view', _vname, concat('| Connection Collation | ', _collation_connection, ' |'));

            -- columns
            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, '## Columns');
            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, '');

            insert into mysqldoc_temp_docs (type, name, line)
            values ('view', _vname, '| Column | Type        | Nullable |');
            insert into mysqldoc_temp_docs (type, name, line)
            values ('view', _vname, '| ------ | ----------- | -------- | ');

            insert into mysqldoc_temp_docs (type, name, line)
            select 'view',
                   _vname,
                   concat('| ', c.column_name, ' | ', c.column_type, ' | ',
                          if(c.is_nullable = 'YES', '&#x2705;', '&#x274C;'), ' |')
            from information_schema.COLUMNS c
            where c.TABLE_SCHEMA = database()
              and c.TABLE_NAME = _vname
            order by c.ORDINAL_POSITION;

            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, '## Definition');

            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, '');
            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, '```sql');
            insert into mysqldoc_temp_docs (type, name, line) values ('view', _vname, replace(_body, '\n', '\r'));
            insert into mysqldoc_temp_docs (type, name, line) values ('table', _vname, '```');

        end loop viewloop;
        close view_cursor;

    end view_block;

    -- end views

    -- stored procedures
    stored_procedure_block:
    begin
        declare _routine_cursor_finished int default 0;
        declare _pname, _sql_data_access varchar(64);
        declare _routine_definition, _routine_comment longtext;
        declare _is_deterministic varchar(3);
        declare _security_type varchar(7);
        declare _created, _last_altered datetime;
        declare _sql_mode varchar(8192);
        declare _definer varchar(93);
        declare _character_set_client, _collation_connection, _database_collation varchar(32);

        declare routine_cursor cursor for select ROUTINE_NAME,
                                                 ROUTINE_DEFINITION,
                                                 IS_DETERMINISTIC,
                                                 SQL_DATA_ACCESS,
                                                 SECURITY_TYPE,
                                                 CREATED,
                                                 LAST_ALTERED,
                                                 SQL_MODE,
                                                 ROUTINE_COMMENT,
                                                 DEFINER,
                                                 CHARACTER_SET_CLIENT,
                                                 COLLATION_CONNECTION,
                                                 DATABASE_COLLATION
                                          from information_schema.routines
                                          where routine_schema = database()
                                            and routine_type = 'PROCEDURE'
                                            and routine_name not like 'mysqldoc_%';

        declare continue handler for not found set _routine_cursor_finished = 1;

        open routine_cursor;

        routineloop:
        loop

            fetch routine_cursor into _pname, _routine_definition, _is_deterministic, _sql_data_access, _security_type, _created, _last_altered, _sql_mode, _routine_comment, _definer, _character_set_client, _collation_connection, _database_collation;

            if _routine_cursor_finished = 1 then leave routineloop; end if;

            insert into mysqldoc_temp_docs (type, name, line) values ('procedure', _pname, '[index.md](index.md)');
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, concat('# Procedure: ', _pname));

            if _routine_comment <> '' then
                insert into mysqldoc_temp_docs (type, name, line)
                values ('procedure', _pname, concat('>', _routine_comment));
            end if;

            insert into mysqldoc_temp_docs (type, name, line) values ('procedure', _pname, '');

            insert into mysqldoc_temp_docs (type, name, line) values ('procedure', _pname, '## Properties');
            insert into mysqldoc_temp_docs (type, name, line) values ('procedure', _pname, '| Property | Value |');
            insert into mysqldoc_temp_docs (type, name, line) values ('procedure', _pname, '| ---- | ------- |');

            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, concat('| Deterministic | ', if(_is_deterministic = 'YES', '&#x2705;', '&#x274C;'),' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, concat('| Data Access | ', _sql_data_access, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, concat('| Security Type | ', _security_type, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, concat('| Created | ', _created, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, concat('| Last Update | ', _last_altered, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, concat('| SQL Mode | ', replace(_sql_mode, ',', ', '), ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, concat('| Definer | ', _definer, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, concat('| Client Character Set | ', _character_set_client, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname,
                    concat('| <nobr>Connection Collation</nobr> | ', _collation_connection, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, concat('| Database Collation | ', _database_collation, ' |'));

            set @param_count = ( select count(*)
                                 from information_schema.PARAMETERS
                                 where SPECIFIC_SCHEMA = database()
                                   and SPECIFIC_NAME = _pname
                                 order by ORDINAL_POSITION );

            if @param_count > 0 then
                insert into mysqldoc_temp_docs (type, name, line) values ('procedure', _pname, '## Parameters');
                insert into mysqldoc_temp_docs (type, name, line)
                values ('procedure', _pname, '| Name | Mode | Data Type');
                insert into mysqldoc_temp_docs (type, name, line)
                values ('procedure', _pname, '| ---- | ---- | ---------');

                insert into mysqldoc_temp_docs (type, name, line)
                select 'procedure',
                       _pname,
                       concat('| ', PARAMETER_NAME, ' | ', PARAMETER_MODE, ' | ', DTD_IDENTIFIER, ' |')
                from information_schema.PARAMETERS
                where SPECIFIC_SCHEMA = database()
                  and SPECIFIC_NAME = _pname
                order by ORDINAL_POSITION;
            end if;

            insert into mysqldoc_temp_docs (type, name, line) values ('procedure', _pname, '## Body');
            insert into mysqldoc_temp_docs (type, name, line) values ('procedure', _pname, '```sql');
            insert into mysqldoc_temp_docs (type, name, line)
            values ('procedure', _pname, replace(replace(_routine_definition, '\n', '\r'), '\t', '    '));
            insert into mysqldoc_temp_docs (type, name, line) values ('procedure', _pname, '```');

        end loop routineloop;
        close routine_cursor;
    end stored_procedure_block;

    -- end stored procedures

    -- functions
    -- call mysqldoc_functions();
    function_block:
    begin
        declare _function_cursor_finished int default 0;
        declare _fname, _sql_data_access, _character_set_name, _collation_name varchar(64);
        declare _routine_definition, _dtd_identifier longtext;
        declare _is_deterministic varchar(3);
        declare _security_type varchar(7);
        declare _created, _last_altered datetime;
        declare _sql_mode varchar(8192);
        declare _definer varchar(93);
        declare _character_set_client, _collation_connection, _database_collation varchar(32);

        declare function_cursor cursor for select ROUTINE_NAME,
                                                  CHARACTER_SET_NAME,
                                                  COLLATION_NAME,
                                                  DTD_IDENTIFIER,
                                                  ROUTINE_DEFINITION,
                                                  IS_DETERMINISTIC,
                                                  SQL_DATA_ACCESS,
                                                  SECURITY_TYPE,
                                                  CREATED,
                                                  LAST_ALTERED,
                                                  SQL_MODE,
                                                  DEFINER,
                                                  CHARACTER_SET_CLIENT,
                                                  COLLATION_CONNECTION,
                                                  DATABASE_COLLATION
                                           from information_schema.routines
                                           where routine_schema = database()
                                             and routine_type = 'FUNCTION'
                                             and routine_name not like 'mysqldoc_%';

        declare continue handler for not found set _function_cursor_finished = 1;

        open function_cursor;

        functionloop:
        loop

            fetch function_cursor into _fname, _character_set_name, _collation_name, _dtd_identifier, _routine_definition, _is_deterministic, _sql_data_access, _security_type, _created, _last_altered, _sql_mode, _definer, _character_set_client, _collation_connection, _database_collation;

            if _function_cursor_finished = 1 then leave functionloop; end if;

            insert into mysqldoc_temp_docs (type, name, line) values ('function', _fname, '[index.md](index.md)');
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('# Function: ', _fname));
            insert into mysqldoc_temp_docs (type, name, line) values ('function', _fname, '');

            insert into mysqldoc_temp_docs (type, name, line) values ('function', _fname, '## Properties');
            insert into mysqldoc_temp_docs (type, name, line) values ('function', _fname, '| Property | Value |');
            insert into mysqldoc_temp_docs (type, name, line) values ('function', _fname, '| ---- | ------- |');

            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Character Set | ', _character_set_name, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Collation | ', _collation_name, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Return Type | ', _dtd_identifier, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Deterministic | ', if(_is_deterministic = 'YES', '&#x2705;', '&#x274C;'),
                                               ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Data Access | ', _sql_data_access, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Created | ', _created, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Security Type | ', _security_type, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Last Update | ', _last_altered, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| SQL Mode | ', replace(_sql_mode, ',', ', '), ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Definer | ', _definer, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Client Character Set | ', _character_set_client, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname,
                    concat('| <nobr>Connection Collation</nobr> | ', _collation_connection, ' |'));
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, concat('| Database Collation | ', _database_collation, ' |'));

            set @func_param_count = ( select count(*)
                                      from information_schema.PARAMETERS
                                      where SPECIFIC_SCHEMA = database()
                                        and SPECIFIC_NAME = _fname
                                        and PARAMETER_MODE is not null
                                      order by ORDINAL_POSITION );

            if @func_param_count > 0 then
                insert into mysqldoc_temp_docs (type, name, line) values ('function', _fname, '## Parameters');
                insert into mysqldoc_temp_docs (type, name, line)
                values ('function', _fname, '| Name | Mode | Data Type');
                insert into mysqldoc_temp_docs (type, name, line)
                values ('function', _fname, '| ---- | ---- | ---------');

                insert into mysqldoc_temp_docs (type, name, line)
                select 'function',
                       _fname,
                       concat('| ', PARAMETER_NAME, ' | ', PARAMETER_MODE, ' | ', DTD_IDENTIFIER, ' |')
                from information_schema.PARAMETERS
                where SPECIFIC_SCHEMA = database()
                  and SPECIFIC_NAME = _fname
                  and PARAMETER_MODE is not null
                order by ORDINAL_POSITION;
            end if;

            insert into mysqldoc_temp_docs (type, name, line) values ('function', _fname, '## Body');
            insert into mysqldoc_temp_docs (type, name, line) values ('function', _fname, '```sql');
            insert into mysqldoc_temp_docs (type, name, line)
            values ('function', _fname, replace(_routine_definition, '\n', '\r'));
            insert into mysqldoc_temp_docs (type, name, line) values ('function', _fname, '```');

        end loop functionloop;
        close function_cursor;
    end function_block;

    -- end functions

    -- export
    if (export = true) then
        export_block:
        begin
            -- call mysqldoc_export(path);
            set @toc_out_text = concat(
                    'select line from mysqldoc_temp_docs where type = \'toc\' and name = \'toc\' order by id into outfile \'',
                    path, 'index.md\' lines terminated by \'\n\'');

            prepare toc_query from @toc_out_text;
            execute toc_query;
            drop prepare toc_query;


            export_table_block:
            begin
                declare _table_cursor_finished INT default 0;
                declare _tname varchar(64);

                declare table_cursor cursor for select table_name
                                                from information_schema.tables
                                                where table_schema = database()
                                                  and table_type = 'BASE TABLE'
                                                  and table_name not in ('mysqldoc_temp_docs', 'mysqldoc_temp_table');

                declare continue handler for not found set _table_cursor_finished = 1;

                open table_cursor;

                tableloop:
                loop
                    fetch table_cursor into _tname;
                    if _table_cursor_finished = 1 then leave tableloop; end if;

                    set @table_out_text = concat(
                            'select line from mysqldoc_temp_docs where type = \'table\' and name = \'', _tname,
                            '\' order by id into outfile \'', path, 'table_', _tname, '.md\'',
                            ' lines terminated by \'\n\'');

                    prepare table_query from @table_out_text;
                    execute table_query;
                    drop prepare table_query;

                end loop tableloop;
                close table_cursor;
            end export_table_block;

            export_view_block:
            begin

                declare _view_cursor_finished INT default 0;
                declare _vname varchar(64);

                declare view_cursor cursor for select table_name
                                               from information_schema.TABLES
                                               where table_schema = database() and table_type = 'view';
                declare continue handler for not found set _view_cursor_finished = 1;

                open view_cursor;

                viewloop:
                loop
                    fetch view_cursor into _vname;
                    if _view_cursor_finished = 1 then leave viewloop; end if;


                    set @view_out_text = concat(
                            'select line from mysqldoc_temp_docs where type = \'view\' and name = \'', _vname,
                            '\' order by id into outfile \'', path, 'view_', _vname, '.md\'',
                            ' lines terminated by \'\n\'');

                    prepare view_query from @view_out_text;
                    execute view_query;
                    drop prepare view_query;

                end loop viewloop;
                close view_cursor;
            end export_view_block;

            export_procedure_block:
            begin

                declare _procedure_cursor_finished INT default 0;
                declare _pname varchar(64);

                declare procedure_cursor cursor for select ROUTINE_NAME
                                                    from information_schema.routines
                                                    where routine_schema = database()
                                                      and routine_type = 'PROCEDURE'
                                                      and routine_name not like 'mysqldoc_%';
                declare continue handler for not found set _procedure_cursor_finished = 1;

                open procedure_cursor;

                procedureloop:
                loop
                    fetch procedure_cursor into _pname;
                    if _procedure_cursor_finished = 1 then leave procedureloop; end if;


                    set @procedure_out_text = concat(
                            'select line from mysqldoc_temp_docs where type = \'procedure\' and name = \'', _pname,
                            '\' order by id into outfile \'', path, 'procedure_', _pname, '.md\'',
                            ' lines terminated by \'\n\'');

                    prepare procedure_query from @procedure_out_text;
                    execute procedure_query;
                    drop prepare procedure_query;

                end loop procedureloop;
                close procedure_cursor;

            end export_procedure_block;

            export_function_block:
            begin

                declare _function_cursor_finished INT default 0;
                declare _fname varchar(64);

                declare function_cursor cursor for select ROUTINE_NAME
                                                   from information_schema.routines
                                                   where routine_schema = database()
                                                     and routine_type = 'FUNCTION'
                                                     and routine_name not like 'mysqldoc_%';
                declare continue handler for not found set _function_cursor_finished = 1;

                open function_cursor;

                functionloop:
                loop
                    fetch function_cursor into _fname;
                    if _function_cursor_finished = 1 then leave functionloop; end if;


                    set @function_out_text = concat(
                            'select line from mysqldoc_temp_docs where type = \'function\' and name = \'', _fname,
                            '\' order by id into outfile \'', path, 'function_', _fname, '.md\'',
                            ' lines terminated by \'\n\'');

                    prepare function_query from @function_out_text;
                    execute function_query;
                    drop prepare function_query;

                end loop functionloop;
                close function_cursor;

            end export_function_block;
        end export_block;

    end if;

end;
$$

delimiter ;