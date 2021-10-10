drop procedure if exists `mysqldoc_export`;
delimiter $$
create procedure mysqldoc_export(
    in path varchar(500)
)
begin
    set @toc_out_text = concat(
            'select line from mysqldoc_temp_docs where type = \'toc\' and name = \'toc\' order by id into outfile \'',
            path, 'index.md\' lines terminated by \'\n\'');

    prepare toc_query from @toc_out_text;
    execute toc_query;
    drop prepare toc_query;


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

            set @table_out_text =
                    concat('select line from mysqldoc_temp_docs where type = \'table\' and name = \'', _tname,
                           '\' order by id into outfile \'', path, 'table_', _tname, '.md\'',
                           ' lines terminated by \'\n\'');

            prepare table_query from @table_out_text;
            execute table_query;
            drop prepare table_query;

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


            set @view_out_text =
                    concat('select line from mysqldoc_temp_docs where type = \'view\' and name = \'', _vname,
                           '\' order by id into outfile \'', path, 'view_', _vname, '.md\'',
                           ' lines terminated by \'\n\'');

            prepare view_query from @view_out_text;
            execute view_query;
            drop prepare view_query;

        end loop viewloop;
        close view_cursor;
    end view_block;

    procedure_block:
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


            set @procedure_out_text =
                    concat('select line from mysqldoc_temp_docs where type = \'procedure\' and name = \'', _pname,
                           '\' order by id into outfile \'', path, 'procedure_', _pname, '.md\'',
                           ' lines terminated by \'\n\'');

            prepare procedure_query from @procedure_out_text;
            execute procedure_query;
            drop prepare procedure_query;

        end loop procedureloop;
        close procedure_cursor;

    end procedure_block;

    function_block:
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


            set @function_out_text =
                    concat('select line from mysqldoc_temp_docs where type = \'function\' and name = \'', _fname,
                           '\' order by id into outfile \'', path, 'function_', _fname, '.md\'',
                           ' lines terminated by \'\n\'');

            prepare function_query from @function_out_text;
            execute function_query;
            drop prepare function_query;

        end loop functionloop;
        close function_cursor;

    end function_block;
end
$$;

delimiter ;
