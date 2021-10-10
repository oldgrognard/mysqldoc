drop procedure if exists `mysqldoc_export`;
delimiter $$
create procedure mysqldoc_export()
begin

    select line
    from mysqldoc_temp_docs
    where type = 'toc'
      and name = 'toc'
    order by id
    into outfile '/var/lib/mysql-files/index.md' lines terminated by '\n';

    table_block:
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

            set @out_text = concat('select line from mysqldoc_temp_docs where type = \'table\' and name = \'', _tname,
                                   '\' order by id into outfile \'/var/lib/mysql-files/table_', _tname, '.md\'',
                                   ' lines terminated by \'\n\'');

            prepare s1 from @out_text;
            execute s1;
            drop prepare s1;

        end loop tableloop;
        close table_cursor;
    end table_block;

    view_block:
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


            set @out_text2 = concat('select line from mysqldoc_temp_docs where type = \'view\' and name = \'', _vname,
                                    '\' order by id into outfile \'/var/lib/mysql-files/view_', _vname, '.md\'',
                                    ' lines terminated by \'\n\'');

            prepare s2 from @out_text2;
            execute s2;
            drop prepare s2;

        end loop viewloop;
        close view_cursor;
    end view_block;

    procedure_block:
    begin

        declare _procedure_cursor_finished INT default 0;
        declare _pname varchar(64);

        declare procedure_cursor cursor for select ROUTINE_NAME
                                            from information_schema.routines
                                            where routine_schema = 'mysqldoc'
                                              and routine_type = 'PROCEDURE'
                                              and routine_name not like 'mysqldoc_%';
        declare continue handler for not found set _procedure_cursor_finished = 1;

        open procedure_cursor;

        procedureloop:
        loop
            fetch procedure_cursor into _pname;
            if _procedure_cursor_finished = 1 then leave procedureloop; end if;


            set @out_text3 =
                    concat('select line from mysqldoc_temp_docs where type = \'procedure\' and name = \'', _pname,
                           '\' order by id into outfile \'/var/lib/mysql-files/proc_', _pname, '.md\'',
                           ' lines terminated by \'\n\'');

            prepare s3 from @out_text3;
            execute s3;
            drop prepare s3;

        end loop procedureloop;
        close procedure_cursor;

    end procedure_block;
end
$$;

delimiter ;
