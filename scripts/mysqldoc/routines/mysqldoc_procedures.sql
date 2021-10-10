drop procedure if exists `mysqldoc_procedures`;
delimiter $$
create procedure mysqldoc_procedures()
begin
    declare _routine_cursor_finished int default 0;
    declare _pname, _sql_data_access varchar(64);
    declare _routine_definition, _routine_comment longtext;
    declare _is_deterministic varchar(3);
    declare _security_type varchar(7);
    declare _created, _last_altered datetime;
    declare _sql_mode varchar(8192);
    declare _definer varchar(93);
    declare _character_set_client, _collation_connection, _database_collation varchar(32);

    declare routine_cursor cursor for select ROUTINE_NAME,
                                             ROUTINE_DEFINITION,
                                             IS_DETERMINISTIC,
                                             SQL_DATA_ACCESS,
                                             SECURITY_TYPE,
                                             CREATED,
                                             LAST_ALTERED,
                                             SQL_MODE,
                                             ROUTINE_COMMENT,
                                             DEFINER,
                                             CHARACTER_SET_CLIENT,
                                             COLLATION_CONNECTION,
                                             DATABASE_COLLATION
                                      from information_schema.routines
                                      where routine_schema = 'mysqldoc'
                                        and routine_type = 'PROCEDURE'
                                        and routine_name not like 'mysqldoc_%';

    declare continue handler for not found set _routine_cursor_finished = 1;

    open routine_cursor;

    routineloop:
    loop

        fetch routine_cursor into
            _pname,
            _routine_definition,
            _is_deterministic,
            _sql_data_access,
            _security_type,
            _created,
            _last_altered,
            _sql_mode,
            _routine_comment,
            _definer,
            _character_set_client,
            _collation_connection,
            _database_collation;

        if _routine_cursor_finished = 1 then leave routineloop; end if;

        call mysqldoc_line('procedure', _pname, '[index.md](index.md)');
        call mysqldoc_line('procedure', _pname, concat('# Procedure: ', _pname));

        if _routine_comment <> '' then call mysqldoc_line('procedure', _pname, concat('>',_routine_comment)); end if;

        call mysqldoc_line('procedure', _pname, '');

        call mysqldoc_line('procedure', _pname, '## Properties');
        call mysqldoc_line('procedure', _pname, '| Property | Value |');
        call mysqldoc_line('procedure', _pname, '| ---- | ------- |');

        call mysqldoc_line('procedure', _pname, concat('| Deterministic | ', mysqldoc_yn(_is_deterministic), ' |'));
        call mysqldoc_line('procedure', _pname, concat('| Data Access | ', _sql_data_access, ' |'));
        call mysqldoc_line('procedure', _pname, concat('| Security Type | ', _security_type, ' |'));
        call mysqldoc_line('procedure', _pname, concat('| Created | ', _created, ' |'));
        call mysqldoc_line('procedure', _pname, concat('| Last Update | ', _last_altered, ' |'));
        call mysqldoc_line('procedure', _pname, concat('| SQL Mode | ', replace(_sql_mode,',',', '), ' |'));


#         call mysqldoc_line('table', tname, '| Timing | Event | Definer | Character Set | Collation | Created |');
#         call mysqldoc_line('table', tname, '| ------ | ----- | ------- | ------------- | --------- | ------- |');
#
#         insert into tmp_docs (type, name, line)
#         select 'table',
#                tname,
#                concat('| ', v_action_timing, ' | ', v_event_manipulation, ' | ', v_definer, ' | ',
#                       v_character_set_client, ' | ', v_collation_connection, ' | ', v_created, ' |');

#         call mysqldoc_line('table', tname, '');
#         call mysqldoc_line('table', tname, '```sql');
#         call mysqldoc_line('table', tname, replace(v_action_statement, '\n', '\r'));
#         call mysqldoc_line('table', tname, '```');

    end loop routineloop;
    close routine_cursor;

end$$

delimiter ;