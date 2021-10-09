drop procedure if exists `mysqldoc_procedures`;
delimiter $$
create procedure mysqldoc_procedures()
begin
    declare v_routine_cursor_finished int default 0;
    declare v_routine_name varchar(64);
    declare v_routine_definition, v_routine_comment longtext;
    declare v_character_set_client, v_collation_connection varchar(32);

    declare routine_cursor cursor for select ROUTINE_NAME, ROUTINE_DEFINITION, ROUTINE_COMMENT
                                      from routines
                                      where routine_schema = database()
                                        and routine_type = 'PROCEDURE'
                                        and routine_name not like 'mysqldoc_%';

    declare continue handler for not found set v_routine_cursor_finished = 1;

        call mysqldoc_line('table', tname, '');
        call mysqldoc_line('table', tname, '## Stored Procedures');

        open routine_cursor;

        routineloop:
        loop

            fetch routine_cursor into v_routine_name, v_routine_definition, v_routine_comment, v_character_set_client, v_collation_connection;
            if v_routine_cursor_finished = 1 then leave routineloop; end if;

            call mysqldoc_line('table', tname, concat('### ', v_trigger_name));

            call mysqldoc_line('table', tname, '| Timing | Event | Definer | Character Set | Collation | Created |');
            call mysqldoc_line('table', tname, '| ------ | ----- | ------- | ------------- | --------- | ------- |');

            insert into tmp_docs (type, name, line)
            select 'table',
                   tname,
                   concat('| ', v_action_timing, ' | ', v_event_manipulation, ' | ', v_definer, ' | ',
                          v_character_set_client, ' | ', v_collation_connection, ' | ', v_created, ' |');

            call mysqldoc_line('table', tname, '');
            call mysqldoc_line('table', tname, '```sql');
            call mysqldoc_line('table', tname, replace(v_action_statement, '\n', '\r'));
            call mysqldoc_line('table', tname, '```');

        end loop triggerloop;
        close trigger_cursor;

    end if;

end$$

delimiter ;