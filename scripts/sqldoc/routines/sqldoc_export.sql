drop procedure if exists `sqldoc_export`;
delimiter $$
create procedure sqldoc_export()
begin

    declare table_cursor_finished INT default 0;
    declare tname varchar(64);

    declare table_cursor cursor for select table_name
                                    from information_schema.tables
                                    where table_schema = database()
                                      and table_type = 'BASE TABLE'
                                      and table_name <> 'tmp_docs';
    declare continue handler for not found set table_cursor_finished = 1;

    select line
    from tmp_docs
    where doc = 'toc'
    order by id
    into outfile '/var/lib/mysql-files/index.md' lines terminated by '\n';

    open table_cursor;

    tableloop:
    loop
        fetch table_cursor into tname;
        if table_cursor_finished = 1 then leave tableloop; end if;

        set @out_text = concat(
            'select line from tmp_docs where doc = \'table_',
            tname,
            '\' order by id into outfile \'/var/lib/mysql-files/table_',
            tname,
            '.md\'',
            ' lines terminated by \'\n\'');

        prepare s1 from @out_text;
        execute s1;
        drop prepare s1;

    end loop tableloop;

end$$

delimiter ;

select line from tmp_docs where doc = 'table_tname' order by id into outfile '/var/lib/mysql-files/table_tname.md'
