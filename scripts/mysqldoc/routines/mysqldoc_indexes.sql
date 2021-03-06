drop procedure if exists `mysqldoc_indexes`;
delimiter $$
create procedure mysqldoc_indexes(
    in tname varchar(200)
)
begin

    set @index_count = ( select count(*)
                       from information_schema.STATISTICS
                       where table_schema = database() and table_name = tname );

    if @index_count > 0 then

        call mysqldoc_line('table', tname, '');

        call mysqldoc_line('table', tname, '## Indexes');
        call mysqldoc_line('table', tname, '| Name | Columns | Unique | Full Text | Comment |');
        call mysqldoc_line('table', tname, '| ---- | ------- | ------ | --------- | ------- |');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'table',
               tname,
               concat('| ', index_name, ' | ', group_concat(distinct column_name order by seq_in_index separator ', '),
                      ' | ', mysqldoc_yn(!NON_UNIQUE), ' | ',
                      mysqldoc_yn(INDEX_TYPE), ' | ', index_comment, ' |')
        from information_schema.STATISTICS
        where TABLE_SCHEMA = database()
          and TABLE_NAME = tname
        group by index_name, NON_UNIQUE, INDEX_TYPE, INDEX_COMMENT
        order by NON_UNIQUE, index_name;

    end if;

end$$

delimiter ;
