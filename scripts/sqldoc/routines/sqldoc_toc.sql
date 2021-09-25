drop procedure if exists `sqldoc_toc`;
delimiter $$
create procedure sqldoc_toc()
begin

    call sqldoc_line('toc', 'toc', concat('# DATABASE', database()));
    call sqldoc_line('toc', 'toc', '__Data Dictionary__');
    call sqldoc_line('toc', 'toc', '## Table of Contents');
    call sqldoc_line('toc', 'toc', '### Tables');
    call sqldoc_line('toc', 'toc', '| Name | Comment | Row Count|');
    call sqldoc_line('toc', 'toc', '| ---- | ------- | ---------: |');

    insert into tmp_docs (type, name, line)
    select 'toc',
           'toc',
           concat('| [', table_name, '](table_', table_name, '.md) | ', table_comment, ' | ', table_rows, ' |')
    from information_schema.tables
    where table_schema = database()
      and table_type = 'BASE TABLE'
      and table_name not in ('tmp_docs', 'tmp_table');

    -- views
    call sqldoc_line('toc', 'toc', '### Views ');
    call sqldoc_line('toc', 'toc', '| Name | Updatable | Definer |');
    call sqldoc_line('toc', 'toc', '| ---- |:---------:| ------- |');

    insert into tmp_docs (type, name, line)
    select 'toc',
           'toc',
           concat('| [', t.TABLE_NAME, '](view_', t.table_name, '.md) | ',
if(v.IS_UPDATABLE = 'YES', '&#9989;', '&#128683;'), ' | ', v.DEFINER, ' |')
    from information_schema.TABLES t
    join
         information_schema.VIEWS v on t.TABLE_SCHEMA = v.TABLE_SCHEMA and t.TABLE_NAME = v.TABLE_NAME
    where t.table_schema = database()
      and table_type = 'VIEW';

end$$

delimiter ;
