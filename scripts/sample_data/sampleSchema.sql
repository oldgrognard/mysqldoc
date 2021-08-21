/*
*********************************************************************
Sample schema
*********************************************************************
*/


/*!40101 set names utf8 */;

/*!40101 set SQL_MODE = ''*/;

/*!40014 set @old_unique_checks = @@unique_checks, UNIQUE_CHECKS = 0 */;
/*!40014 set @old_foreign_key_checks = @@foreign_key_checks, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 set @old_sql_mode = @@sql_mode, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 set @old_sql_notes = @@sql_notes, SQL_NOTES = 0 */;
create database /*!32312 if not exists */`sqldoc` /*!40100 default character set latin1 */;

use `sqldoc`;

/*Table structure for table `customer` */

drop table if exists `customer`;

create table `customer`
(
    `customer_number`           int(11)        not null comment 'Our assigned customer number',
    `customer_name`             varchar(50)    not null comment 'Company or individual name',
    `contact_last_name`         varchar(50)    not null comment 'Company contact\'s last name',
    `contact_first_name`        varchar(50)    not null comment 'Company contact\'s first name',
    `phone`                     varchar(50)    not null,
    `address_line_1`            varchar(50)    not null,
    `address_line_2`            varchar(50)    not null default '',
    `city`                      varchar(50)    not null default '',
    `state`                     varchar(50)    not null default '',
    `postal_code`               varchar(15)    not null default '',
    `country`                   varchar(50)    not null default '',
    `sales_rep_employee_number` int(11)        not null default 0,
    `credit_limit`              decimal(10, 2) not null default 0,
    constraint `pk_customer_number` primary key (`customer_number`),
    key `ix_sales_rep_employee_number` (`sales_rep_employee_number`),
    constraint `fk_customer__employee` foreign key (`sales_rep_employee_number`) references `employee` (`employee_number`)
) engine = InnoDB
  default charset = latin1 comment ='Collection of existing customers';


/* Table structure for employee` table */

drop table if exists `employee`;

create table `employee`
(
    `employee_number` int(11)      not null,
    `last_name`       varchar(50)  not null default '',
    `first_name`      varchar(50)  not null default '',
    `extension`       varchar(10)  not null default '',
    `email`           varchar(254) not null default '',
    `office_code`     varchar(10)  not null default '',
    `reports_to`      int(11)      not null default 0,
    `job_title`       varchar(50)  not null default '',
    constraint `pk_employee` primary key (`employee_number`),
    key `ix_reports_to` (`reports_to`),
    key `ix_office_code` (`office_code`),
    constraint `fk_employee__employee` foreign key (`reports_to`) references `employee` (`employee_number`),
    constraint `fk_employee__office` foreign key (`office_code`) references `office` (`office_code`)
) engine = InnoDB
  default charset = latin1;


drop table if exists `employee_audit`;

create table `employee_audit`
(
    employee_number int                                 not null,
    old_row_data    JSON,
    new_row_data    JSON,
    operation       enum ('INSERT', 'UPDATE', 'DELETE') not null,
    event_timestamp timestamp                           not null default now(),
    constraint `pk_employee_audit` primary key (employee_number, operation, event_timestamp)
) engine = InnoDB
  default charset = latin1;

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

create trigger employee_upd
    after update
    on employee
    for each row
begin
    insert into employee_audit (employee_number, old_row_data, new_row_data, operation)
    values (NEW.employee_number,
            json_object("last_name", OLD.last_name, "first_name", OLD.first_name, "extension", OLD.extension, "email", OLD.email, "office_code",
                        OLD.office_code, "reports_to", OLD.reports_to, "job_title", OLD.job_title),
            json_object("last_name", NEW.last_name, "first_name", NEW.first_name, "extension", NEW.extension, "email", NEW.email, "office_code",
                        NEW.office_code, "reports_to", NEW.reports_to, "job_title", NEW.job_title),
            'UPDATE');
end;


/* Table structure for `office`btable */

drop table if exists `office`;

create table `office`
(
    `office_code`    varchar(10) not null,
    `city`           varchar(50) not null default '',
    `phone`          varchar(50) not null default '',
    `address_line_1` varchar(50) not null default '',
    `address_line_2` varchar(50) not null default '',
    `state`          varchar(50) not null default '',
    `country`        varchar(50) not null default '',
    `postal_code`    varchar(15) not null default '',
    `territory`      varchar(10) not null default '',
    constraint `pk_office` primary key (`office_code`)
) engine = InnoDB
  default charset = latin1;

/*Table structure for table `order` */

drop table if exists `order`;

create table `order`
(
    `order_number`    int(11)     not null,
    `order_date`      date        not null,
    `required_date`   date        not null,
    `shipped_date`    date        not null default '0000-00-00',
    `status`          varchar(15) not null,
    `comment`         text                 default null,
    `customer_number` int(11)     not null,
    constraint `pk_order` primary key (`order_number`),
    key `ix_customer_number` (`customer_number`),
    constraint `fk_order__customer` foreign key (`customer_number`) references `customer` (`customer_number`)
) engine = InnoDB
  default charset = latin1;


/*Table structure for `order_detail` table */

drop table if exists `order_detail`;

create table `order_detail`
(
    `order_number`      int(11)        not null,
    `product_code`      varchar(15)    not null,
    `quantity_ordered`  int(11)        not null,
    `price_each`        decimal(10, 2) not null,
    `order_line_number` smallint(6)    not null,
    constraint `pk_order_detail` primary key (`order_number`, `product_code`),
    key `ix_product_code` (`product_code`),
    constraint `fk_orderdetail__order` foreign key (`order_number`) references `order` (`order_number`),
    constraint `fk_orderdetail__product` foreign key (`product_code`) references `product` (`code`)
) engine = InnoDB
  default charset = latin1;


/* Table structure for `payment` table */

drop table if exists `payment`;

create table `payment`
(
    `customer_number` int(11)        not null,
    `check_number`    varchar(50)    not null,
    `payment_date`    date           not null,
    `amount`          decimal(10, 2) not null,
    constraint `pk_payment` primary key (`customer_number`, `check_number`),
    constraint `fk_payment__customer` foreign key (`customer_number`) references `customer` (`customer_number`)
) engine = InnoDB
  default charset = latin1;


/* Table structure for `product_line` table */

drop table if exists `product_line`;

create table `product_line`
(
    `product_line`     varchar(50)   not null,
    `text_description` varchar(4000) not null default '',
    `html_description` mediumtext    not null default '',
    `image`            mediumblob    not null default '',
    constraint `pk_product_line` primary key (`product_line`)
) engine = InnoDB
  default charset = latin1;


/* Table structure for `product` table */

drop table if exists `product`;

create table `product`
(
    `code`              varchar(15)    not null,
    `name`              varchar(70)    not null,
    `product_line`      varchar(50)    not null,
    `scale`             varchar(10)    not null,
    `vendor`            varchar(50)    not null,
    `description`       text           not null,
    `quantity_in_stock` smallint(6)    not null,
    `buy_price`         decimal(10, 2) not null,
    `msrp`              decimal(10, 2) not null,
    constraint `pk_product` primary key (`code`),
    key `ix_product_line` (`product_line`),
    constraint `fk_product__product_line` foreign key (`product_line`) references `product_line` (`product_line`)
) engine = InnoDB
  default charset = latin1;


drop table if exists `suppliers`;

create table suppliers
(
    supplier_id INT auto_increment,
    name        VARCHAR(255) not null,
    phone       VARCHAR(15)  not null unique,
    address     VARCHAR(255) not null,
    primary key (supplier_id),
    constraint uc_name_address unique (name, address)
);

/* customer payments view */
create or replace view customer_payments as
select customer_name, check_number, payment_date, amount
from customer
         inner join payment using (customer_number);

create or replace view product_product_line as
select code, description, pl.product_line, text_description
from product p
         inner join product_line pl on p.product_line = pl.product_line;

/*!40101 set SQL_MODE = @old_sql_mode */;
/*!40014 set FOREIGN_KEY_CHECKS = @old_foreign_key_checks */;
/*!40014 set UNIQUE_CHECKS = @old_unique_checks */;
/*!40111 set SQL_NOTES = @old_sql_notes */;
