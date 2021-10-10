drop procedure if exists `mysqldoc_main`;
delimiter $$
create procedure mysqldoc_main(
    in export boolean,
    in diagrams boolean
)
begin

    drop table if exists mysqldoc_temp_docs;
    drop table if exists mysqldoc_temp_table;

    create table mysqldoc_temp_docs
    (
        id   int auto_increment,
        type varchar(100) not null         default 'toc',
        name varchar(200) not null         default 'toc',
        line varchar(4000) charset utf8mb4 default '' null,
        constraint mysqldoc_temp_docs_pk primary key (id)
    );

    create table mysqldoc_temp_table
    (
        id         int         not null default 1,
        table_name varchar(64) not null default ''
    );

    call mysqldoc_toc();
    call mysqldoc_tables(diagrams);
    call mysqldoc_views();
    call mysqldoc_procedures();

    if (export = true) then call mysqldoc_export(); end if;

end;
$$

delimiter ;