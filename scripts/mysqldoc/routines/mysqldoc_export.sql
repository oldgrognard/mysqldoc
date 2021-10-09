drop procedure if exists `mysqldoc_export`;
delimiter $$
create procedure mysqldoc_export()
begin
    table_block:
    begin
        declare table_cursor_finished INT default 0;
        declare tname varchar(64);

        declare table_cursor cursor for select table_name
                                        from information_schema.tables
                                        where table_schema = database()
                                          and table_type = 'BASE TABLE'
                                          and table_name not in ('mysqldoc_temp_docs', 'mysqldoc_temp_table');

        declare continue handler for not found set table_cursor_finished = 1;

        select line
        from mysqldoc_temp_docs
        where type = 'toc'
          and name = 'toc'
        order by id
        into outfile '/var/lib/mysql-files/index.md' lines terminated by '\n';

        open table_cursor;

        tableloop:
        loop
            fetch table_cursor into tname;
            if table_cursor_finished = 1 then leave tableloop; end if;

            set @out_text = concat('select line from mysqldoc_temp_docs where type = \'table\' and name = \'', tname,
                                   '\' order by id into outfile \'/var/lib/mysql-files/table_', tname, '.md\'',
                                   ' lines terminated by \'\n\'');

            prepare s1 from @out_text;
            execute s1;
            drop prepare s1;

        end loop tableloop;
        close table_cursor;
    end table_block;

    view_block:
    begin

        declare view_cursor_finished INT default 0;
        declare vname varchar(64);

        declare view_cursor cursor for select table_name
                                       from information_schema.TABLES
                                       where table_schema = database() and table_type = 'view';
        declare continue handler for not found set view_cursor_finished = 1;

        open view_cursor;

        viewloop:
        loop
            fetch view_cursor into vname;
            if view_cursor_finished = 1 then leave viewloop; end if;


            set @out_text2 = concat('select line from mysqldoc_temp_docs where type = \'view\' and name = \'', vname,
                                    '\' order by id into outfile \'/var/lib/mysql-files/view_', vname, '.md\'',
                                    ' lines terminated by \'\n\'');

            prepare s2 from @out_text2;
            execute s2;
            drop prepare s2;

        end loop viewloop;
        close view_cursor;
    end view_block;
end
$$

delimiter ;
