drop procedure if exists `sqldoc_tables`;
delimiter $$
create procedure sqldoc_tables()
begin

    declare table_cursor_finished int default 0;
    declare tname varchar(64);
    declare tcomment varchar(2048);
    declare keycount int;

    declare table_cursor cursor for select table_name, table_comment
                                    from information_schema.tables
                                    where table_schema = database()
                                      and table_type = 'BASE TABLE'
                                      and table_name <> 'tmp_docs';
    declare continue handler for not found set table_cursor_finished = 1;

    insert into tmp_docs (doc, line) values ('toc', '### Tables');
    insert into tmp_docs (doc, line) values ('toc', '&#128273; = primary key');
    insert into tmp_docs (doc, line) values ('toc', '&#128477; = foreign key');

    open table_cursor;

    tableloop:
    loop
        fetch table_cursor into tname, tcomment;
        if table_cursor_finished = 1 then leave tableloop; end if;

        insert into tmp_docs (doc, line) values (concat('table_', tname), '[index.md](index.md)');
        insert into tmp_docs (doc, line) values (concat('table_', tname), concat('# Table: ', tname));
        if tcomment <> '' then insert into tmp_docs (doc, line) values (concat('table_', tname), tcomment); end if;

        -- mermaid diagram
        set keycount = ( select count(*)
                         from information_schema.KEY_COLUMN_USAGE
                         where table_schema = 'sqldoc' and TABLE_NAME = tname and REFERENCED_TABLE_NAME is not null and
                               table_name = tname
                            or REFERENCED_TABLE_NAME = tname );

        if keycount > 0 then
            insert into tmp_docs (doc, line) values (concat('table_', tname), '```mermaid');
            insert into tmp_docs (doc, line) values (concat('table_', tname), 'erDiagram');

            insert into tmp_docs (doc, line)
            select concat('table_', tname), concat(table_name, ' ||--|{ ', REFERENCED_TABLE_NAME, ' : ""')
            from information_schema.KEY_COLUMN_USAGE
            where table_schema = database() and REFERENCED_TABLE_NAME is not null and table_name = tname
               or REFERENCED_TABLE_NAME = tname;
            insert into tmp_docs (doc, line) values (concat('table_', tname), '```');
        end if;

        -- columns
        insert into tmp_docs (doc, line)
        values (concat('table_', tname), '| Key  | Column | Type        | Default | Nullable | Comment |'),
               (concat('table_', tname), '| ---- | ------ | ----------- | ------- | -------- | ------- |');

        insert into tmp_docs (doc, line)
        select concat('table_', tname),
               concat('| ', case when column_key like '%PRI%' then '&#128273;'
                                 when column_key like '%MUL%' then '&#128477;'
                                 else '' end, ' | ', column_name, ' | ', column_type, ' | ',
                      if(column_default = '', 'empty string', ifnull(column_default, '')), ' | ',
                      if(is_nullable = 'NO', '&#128683;', '&#9989;'), ' | ', column_comment, ' |')
        from information_schema.columns
        where table_schema = database()
          and table_name = tname
        order by ordinal_position;


    end loop tableloop;

end$$

delimiter ;