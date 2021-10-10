drop procedure if exists `mysqldoc_toc`;
delimiter $$
create procedure mysqldoc_toc()
begin
    declare view_count int;

    call mysqldoc_line('toc', 'toc', concat('# DATABASE: ', database()));
    call mysqldoc_line('toc', 'toc', '__Data Dictionary__');
    call mysqldoc_line('toc', 'toc', '## Table of Contents');
    call mysqldoc_line('toc', 'toc', '### Tables');
    call mysqldoc_line('toc', 'toc', '| Name | Comment | Row Count|');
    call mysqldoc_line('toc', 'toc', '| ---- | ------- | ---------: |');

    insert into mysqldoc_temp_docs (type, name, line)
    select 'toc',
           'toc',
           concat('| [', table_name, '](table_', table_name, '.md) | ', table_comment, ' | ', table_rows, ' |')
    from information_schema.tables
    where table_schema = database()
      and table_type = 'BASE TABLE'
      and table_name not in ('mysqldoc_temp_docs', 'mysqldoc_temp_table');

    -- views
    set view_count = ( select count(*) as num
                       from information_schema.tables t
                                join information_schema.VIEWS v
                                     on t.TABLE_SCHEMA = v.TABLE_SCHEMA and t.TABLE_NAME = v.TABLE_NAME
                       where table_type = 'VIEW'
                         and t.TABLE_SCHEMA = database() );

    if view_count > 0 then

        call mysqldoc_line('toc', 'toc', '### Views ');
        call mysqldoc_line('toc', 'toc', '| Name | Updatable | Definer |');
        call mysqldoc_line('toc', 'toc', '| ---- |:---------:| ------- |');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'toc',
               'toc',
               concat('| [', t.TABLE_NAME, '](view_', t.table_name, '.md) | ',
                      mysqldoc_yn(v.IS_UPDATABLE), ' | ', v.DEFINER, ' |')
        from information_schema.TABLES t
                 join information_schema.VIEWS v on t.TABLE_SCHEMA = v.TABLE_SCHEMA and t.TABLE_NAME = v.TABLE_NAME
        where t.table_schema = database()
          and table_type = 'VIEW';
    end if;

    -- stored procedures
    set @proc_count = (select count(*) from information_schema.routines r
    where routine_schema = database()
      and routine_type = 'PROCEDURE'
      and routine_name not like 'mysqldoc_%');

    if @proc_count > 0 then
        call mysqldoc_line('toc', 'toc', '### Stored Procedures');
        call mysqldoc_line('toc', 'toc', '| Name | Deterministic | Data Access | Definer | Comment |');
        call mysqldoc_line('toc', 'toc', '| ---- | ------------- | ----------- | ------- | ------- |');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'toc', 'toc', concat(
            '| [', ROUTINE_NAME, '](proc_', ROUTINE_NAME, '.md)',
            ' | ', mysqldoc_yn(IS_DETERMINISTIC),
            ' | ', SQL_DATA_ACCESS,
            ' | ', DEFINER,
            ' | ', ROUTINE_COMMENT,
            ' |'
            )
        from information_schema.routines r
        where routine_schema = database()
          and routine_type = 'PROCEDURE'
          and routine_name not like 'mysqldoc_%'
        order by r.routine_name;


    end if;

end$$

delimiter ;
