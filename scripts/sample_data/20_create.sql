create table if not exists employee_audit
(
    employee_number int                                 not null,
    old_row_data    json                                null,
    new_row_data    json                                null,
    operation       enum ('INSERT', 'UPDATE', 'DELETE') not null,
    event_timestamp timestamp default current_timestamp not null,
    primary key (employee_number, operation, event_timestamp)
);

create table if not exists office
(
    office_code    varchar(10)            not null primary key,
    city           varchar(50) default '' not null,
    phone          varchar(50) default '' not null,
    address_line_1 varchar(50) default '' not null,
    address_line_2 varchar(50) default '' not null,
    state          varchar(50) default '' not null,
    country        varchar(50) default '' not null,
    postal_code    varchar(15) default '' not null,
    territory      varchar(10) default '' not null
);

create table if not exists employee
(
    employee_number int                     not null primary key,
    last_name       varchar(50)  default '' not null,
    first_name      varchar(50)  default '' not null,
    extension       varchar(10)  default '' not null,
    email           varchar(254) default '' not null,
    office_code     varchar(10)  default '' not null,
    reports_to      int          default 0  not null,
    job_title       varchar(50)  default '' not null,
    constraint fk_employee__employee foreign key (reports_to) references employee (employee_number),
    constraint fk_employee__office foreign key (office_code) references office (office_code)
);

create table if not exists customer
(
    customer_number           int                         not null comment 'Our assigned customer number' primary key,
    customer_name             varchar(50)                 not null comment 'Company or individual name',
    contact_last_name         varchar(50)                 not null comment 'Company contact''s last name',
    contact_first_name        varchar(50)                 not null comment 'Company contact''s first name',
    phone                     varchar(50)                 not null,
    address_line_1            varchar(50)                 not null,
    address_line_2            varchar(50)    default ''   not null,
    city                      varchar(50)    default ''   not null,
    state                     varchar(50)    default ''   not null,
    postal_code               varchar(15)    default ''   not null,
    country                   varchar(50)    default ''   not null,
    sales_rep_employee_number int            default 0    not null,
    credit_limit              decimal(10, 2) default 0.00 not null,
    constraint fk_customer__employee foreign key (sales_rep_employee_number) references employee (employee_number)
) comment 'Collection of existing customers';

create index ix_sales_rep_employee_number on customer (sales_rep_employee_number);

create index ix_office_code on employee (office_code);

create index ix_reports_to on employee (reports_to);

create trigger employee_del
    after delete
    on employee
    for each row
begin
    insert into employee_audit (employee_number, old_row_data, new_row_data, operation)
    values (OLD.employee_number,
            json_object("last_name", OLD.last_name, "first_name", OLD.first_name, "extension", OLD.extension, "email",
                        OLD.email, "office_code", OLD.office_code, "reports_to", OLD.reports_to, "job_title",
                        OLD.job_title),
            null,
            'DELETE');
end;

create trigger employee_ins
    after insert
    on employee
    for each row
begin
    insert into employee_audit (employee_number, old_row_data, new_row_data, operation)
    values (NEW.employee_number,
            null,
            json_object("last_name", NEW.last_name, "first_name", NEW.first_name, "extension", NEW.extension, "email",
                        NEW.email, "office_code", NEW.office_code, "reports_to", NEW.reports_to, "job_title",
                        NEW.job_title),
            'INSERT');
end;

create trigger employee_upd
    after update
    on employee
    for each row
begin
    insert into employee_audit (employee_number, old_row_data, new_row_data, operation)
    values (NEW.employee_number,
            json_object("last_name", OLD.last_name, "first_name", OLD.first_name, "extension", OLD.extension, "email",
                        OLD.email, "office_code", OLD.office_code, "reports_to", OLD.reports_to, "job_title",
                        OLD.job_title),
            json_object("last_name", NEW.last_name, "first_name", NEW.first_name, "extension", NEW.extension, "email",
                        NEW.email, "office_code", NEW.office_code, "reports_to", NEW.reports_to, "job_title",
                        NEW.job_title),
            'UPDATE');
end;

create table if not exists `order`
(
    order_number    int                       not null primary key,
    order_date      date                      not null,
    required_date   date                      not null,
    shipped_date    date default '1900-01-01' not null,
    status          varchar(15)               not null,
    comment         text                      null,
    customer_number int                       not null,
    constraint fk_order__customer foreign key (customer_number) references customer (customer_number)
);

create index ix_customer_number on `order` (customer_number);

create table if not exists payment
(
    customer_number int            not null,
    check_number    varchar(50)    not null,
    payment_date    date           not null,
    amount          decimal(10, 2) not null,
    primary key (customer_number, check_number),
    constraint fk_payment__customer foreign key (customer_number) references customer (customer_number)
);

create table if not exists product_line
(
    product_line     varchar(50)              not null primary key,
    text_description varchar(4000) default '' not null,
    html_description mediumtext               not null,
    image            mediumblob               not null
);

create table if not exists product
(
    code              varchar(15)    not null primary key,
    name              varchar(70)    not null,
    product_line      varchar(50)    not null,
    scale             varchar(10)    not null,
    vendor            varchar(50)    not null,
    description       text           not null,
    quantity_in_stock smallint       not null,
    buy_price         decimal(10, 2) not null,
    msrp              decimal(10, 2) not null,
    constraint fk_product__product_line foreign key (product_line) references product_line (product_line)
);

create table if not exists order_detail
(
    order_number      int            not null,
    product_code      varchar(15)    not null,
    quantity_ordered  int            not null,
    price_each        decimal(10, 2) not null,
    order_line_number smallint       not null,
    primary key (order_number, product_code),
    constraint fk_orderdetail__order foreign key (order_number) references `order` (order_number),
    constraint fk_orderdetail__product foreign key (product_code) references product (code)
);

create index ix_product_code on order_detail (product_code);

create index ix_product_line on product (product_line);

create table if not exists suppliers
(
    supplier_id int auto_increment primary key,
    name        varchar(255) not null,
    phone       varchar(15)  not null,
    address     varchar(255) not null,
    constraint phone unique (phone),
    constraint uc_name_address unique (name, address)
);

create view customer_payments as
select `sqldoc`.`customer`.`customer_name` as `customer_name`,
       `sqldoc`.`payment`.`check_number`   as `check_number`,
       `sqldoc`.`payment`.`payment_date`   as `payment_date`,
       `sqldoc`.`payment`.`amount`         as `amount`
from (`sqldoc`.`customer`
         join `sqldoc`.`payment` on ((`sqldoc`.`customer`.`customer_number` = `sqldoc`.`payment`.`customer_number`)));

-- comment on column customer_payments.customer_name not supported: Company or individual name

create view product_product_line as
select `p`.`code`              as `code`,
       `p`.`description`       as `description`,
       `pl`.`product_line`     as `product_line`,
       `pl`.`text_description` as `text_description`
from (`sqldoc`.`product` `p`
         join `sqldoc`.`product_line` `pl` on ((`p`.`product_line` = `pl`.`product_line`)));

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

    -- SELECT line FROM tmp_docs ORDER BY id INTO OUTFILE '/var/lib/mysql-files/dbdocs.md' LINES TERMINATED BY '\n';
    open table_cursor;

    tableloop:
    loop
        fetch table_cursor into tname;
        if table_cursor_finished = 1 then leave tableloop; end if;

        -- set @tname = 'tname';

        set @out_text = concat('select line from tmp_docs where doc = \'table_', tname,
                               '\' order by id into outfile \'/var/lib/mysql-files/table_', tname, '.md\'',
                               ' lines terminated by \'\n\'');

--        select @out_text;

        prepare s1 from @out_text;
        execute s1;
        drop prepare s1;

    end loop tableloop;

end;

create procedure sqldoc_main(in export tinyint(1))
begin

    drop table if exists tmp_docs;

    create table tmp_docs
    (
        id   int auto_increment,
        doc  varchar(200) not null         default 'toc',
        line varchar(4000) charset utf8mb4 default '' null,
        constraint tmp_docs_pk primary key (id)
    );

    call sqldoc_toc();
    call sqldoc_tables();

    if (export = true) then call sqldoc_export(); end if;
end;

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

    open table_cursor;

    tableloop:
    loop
        fetch table_cursor into tname, tcomment;
        if table_cursor_finished = 1 then leave tableloop; end if;

        insert into tmp_docs (doc, line)
        values (concat('table_', tname), '[index.md](index.md)'),
               (concat('table_', tname), concat('# Table: ', tname));

        if tcomment <> '' then insert into tmp_docs (doc, line) values (concat('table_', tname), tcomment); end if;

        -- columns
        insert into tmp_docs (doc, line) values (concat('table_', tname), '## Columns');

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

        -- foreign keys
        insert into tmp_docs (doc, line) values (concat('table_', tname), '## Foreign Keys');
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

        -- indexes
        insert into tmp_docs (doc, line)
        values (concat('table_', tname), '## Indexes'),
               (concat('table_', tname), '| Name | Columns | Unique | Comment |'),
               (concat('table_', tname), '| ---- | ------- | ------ | ------- |');

        insert into tmp_docs (doc, line)
        select concat('table_', tname)                                                        as doc,
               concat('| ', index_name, ' | ', group_concat(column_name order by SEQ_IN_INDEX separator ', '), ' | ',
                      if(NON_UNIQUE = 1, '&#128683;', '&#9989;'), ' | ', index_comment, ' |') as line
        from information_schema.STATISTICS
        where table_name = tname
          and index_name <> 'PRIMARY'
        group by index_name, index_comment, NON_UNIQUE;

    end loop tableloop;

end;

create procedure sqldoc_toc()
begin

    insert into tmp_docs (doc, line)
    values ('toc', concat('# DATABASE: ', database())),
           ('toc', '__Data Dictionary__'),
           ('toc', '## Table of Contents'),
           ('toc', '### Tables'),
           ('toc', '| Name | Comment | Row Count|'),
           ('toc', '| ---- | ------- | ---------: |');


    insert into tmp_docs (doc, line)
    select 'toc', concat('| [', table_name, '](table_', table_name, '.md) | ', table_comment, ' | ', table_rows, ' |')
    from information_schema.tables
    where table_schema = database()
      and table_type = 'BASE TABLE'
      and table_name <> 'tmp_docs';

end;

