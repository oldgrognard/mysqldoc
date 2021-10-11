drop procedure if exists `mysqldoc_functions`;
delimiter $$
create procedure mysqldoc_functions()
begin
    declare _function_cursor_finished int default 0;
    declare _fname, _sql_data_access, _character_set_name, _collation_name varchar(64);
    declare _routine_definition, _dtd_identifier longtext;
    declare _is_deterministic varchar(3);
    declare _security_type varchar(7);
    declare _created, _last_altered datetime;
    declare _sql_mode varchar(8192);
    declare _definer varchar(93);
    declare _character_set_client, _collation_connection, _database_collation varchar(32);

    declare function_cursor cursor for select ROUTINE_NAME,
                                              CHARACTER_SET_NAME,
                                              COLLATION_NAME,
                                              DTD_IDENTIFIER,
                                              ROUTINE_DEFINITION,
                                              IS_DETERMINISTIC,
                                              SQL_DATA_ACCESS,
                                              SECURITY_TYPE,
                                              CREATED,
                                              LAST_ALTERED,
                                              SQL_MODE,
                                              DEFINER,
                                              CHARACTER_SET_CLIENT,
                                              COLLATION_CONNECTION,
                                              DATABASE_COLLATION
                                       from information_schema.routines
                                       where routine_schema = database()
                                         and routine_type = 'FUNCTION'
                                         and routine_name not like 'mysqldoc_%';

    declare continue handler for not found set _function_cursor_finished = 1;

    open function_cursor;

    functionloop:
    loop

        fetch function_cursor into _fname, _character_set_name, _collation_name, _dtd_identifier, _routine_definition, _is_deterministic, _sql_data_access, _security_type, _created, _last_altered, _sql_mode, _definer, _character_set_client, _collation_connection, _database_collation;

        if _function_cursor_finished = 1 then leave functionloop; end if;

        call mysqldoc_line('function', _fname, '[index.md](index.md)');
        call mysqldoc_line('function', _fname, concat('# Function: ', _fname));
        call mysqldoc_line('function', _fname, '');

        call mysqldoc_line('function', _fname, '## Properties');
        call mysqldoc_line('function', _fname, '| Property | Value |');
        call mysqldoc_line('function', _fname, '| ---- | ------- |');

        call mysqldoc_line('function', _fname, concat('| Character Set | ', _character_set_name, ' |'));
        call mysqldoc_line('function', _fname, concat('| Collation | ', _collation_name, ' |'));
        call mysqldoc_line('function', _fname, concat('| Return Type | ', _dtd_identifier, ' |'));
        call mysqldoc_line('function', _fname, concat('| Deterministic | ', mysqldoc_yn(_is_deterministic), ' |'));
        call mysqldoc_line('function', _fname, concat('| Data Access | ', _sql_data_access, ' |'));
        call mysqldoc_line('function', _fname, concat('| Created | ', _created, ' |'));
        call mysqldoc_line('function', _fname, concat('| Security Type | ', _security_type, ' |'));
        call mysqldoc_line('function', _fname, concat('| Last Update | ', _last_altered, ' |'));
        call mysqldoc_line('function', _fname, concat('| SQL Mode | ', replace(_sql_mode, ',', ', '), ' |'));
        call mysqldoc_line('function', _fname, concat('| Definer | ', _definer, ' |'));
        call mysqldoc_line('function', _fname, concat('| Client Character Set | ', _character_set_client, ' |'));
        call mysqldoc_line('function', _fname,
                           concat('| <nobr>Connection Collation</nobr> | ', _collation_connection, ' |'));
        call mysqldoc_line('function', _fname, concat('| Database Collation | ', _database_collation, ' |'));

        set @func_param_count = ( select count(*)
                                  from information_schema.PARAMETERS
                                  where SPECIFIC_SCHEMA = database()
                                    and SPECIFIC_NAME = _fname
                                    and PARAMETER_MODE is not null
                                  order by ORDINAL_POSITION );

        if @func_param_count > 0 then
            call mysqldoc_line('function', _fname, '## Parameters');
            call mysqldoc_line('function', _fname, '| Name | Mode | Data Type');
            call mysqldoc_line('function', _fname, '| ---- | ---- | ---------');

            insert into mysqldoc_temp_docs (type, name, line)
            select 'function', _fname, concat('| ', PARAMETER_NAME, ' | ', PARAMETER_MODE, ' | ', DTD_IDENTIFIER, ' |')
            from information_schema.PARAMETERS
            where SPECIFIC_SCHEMA = database()
              and SPECIFIC_NAME = _fname
              and PARAMETER_MODE is not null
            order by ORDINAL_POSITION;
        end if;

        call mysqldoc_line('function', _fname, '## Body');
        call mysqldoc_line('function', _fname, '```sql');
        call mysqldoc_line('function', _fname, replace(_routine_definition, '\n', '\r'));
        call mysqldoc_line('function', _fname, '```');

    end loop functionloop;
    close function_cursor;
end$$

delimiter ;