drop procedure if exists `mysqldoc_indexes`;
delimiter $$
create procedure mysqldoc_indexes(
    in tname varchar(200)
)
begin

    declare indexcount int;

    set indexcount = ( select count(*)
                       from information_schema.STATISTICS
                       where table_schema = database() and table_name = tname );

    if indexcount > 0 then

        call mysqldoc_line('table', tname, '');

        call mysqldoc_line('table', tname, '## Indexes');
        call mysqldoc_line('table', tname, '| Name | Columns | Unique | Full Text | Comment |');
        call mysqldoc_line('table', tname, '| ---- | ------- | ------ | --------- | ------- |');

        insert into tmp_docs (type, name, line)
        select 'table',
               tname,
               concat('| ', index_name, ' | ', group_concat(distinct column_name order by seq_in_index separator ', '),
                      ' | ', if(NON_UNIQUE = 1, '&#128683;', '&#9989;'), ' | ',
                      if(INDEX_TYPE = 'FULLTEXT', '&#9989;', '&#128683;'), ' | ', index_comment, ' |')
        from information_schema.STATISTICS
        where TABLE_SCHEMA = database()
          and TABLE_NAME = tname
        group by index_name, NON_UNIQUE, INDEX_TYPE, INDEX_COMMENT
        order by NON_UNIQUE, index_name;

    end if;

end$$

delimiter ;
