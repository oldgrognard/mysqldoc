drop procedure if exists `sqldoc_triggers`;
delimiter $$
create procedure sqldoc_triggers(
    in tname varchar(64)
)
begin
    declare v_trigger_cursor_finished int default 0;
    declare v_trigger_name varchar(64);
    declare v_event_manipulation, v_action_timing varchar(6);
    declare v_action_statement longtext;
    declare v_created datetime(2);
    declare v_definer varchar(93);
    declare v_character_set_client, v_collation_connection varchar(32);
    declare trigger_count int;

    declare trigger_cursor cursor for select TRIGGER_NAME,
                                             ACTION_TIMING,
                                             EVENT_MANIPULATION,
                                             DEFINER,
                                             CHARACTER_SET_CLIENT,
                                             COLLATION_CONNECTION,
                                             CREATED,
                                             ACTION_STATEMENT
                                      from information_schema.triggers
                                      where EVENT_OBJECT_SCHEMA = database()
                                        and EVENT_OBJECT_TABLE = tname;

    declare continue handler for not found set v_trigger_cursor_finished = 1;

    set trigger_count = ( select count(*)
                          from information_schema.triggers
                          where EVENT_OBJECT_SCHEMA = database() and EVENT_OBJECT_TABLE = tname
    );

    if trigger_count > 0 then

    call sqldoc_line('table', tname, '');
    call sqldoc_line('table', tname, '## Triggers');

    open trigger_cursor;

    triggerloop:
    loop

        fetch trigger_cursor into v_trigger_name, v_action_timing, v_event_manipulation, v_definer, v_character_set_client, v_collation_connection, v_created, v_action_statement;
        if v_trigger_cursor_finished = 1 then leave triggerloop; end if;

        call sqldoc_line('table', tname, concat('### ', v_trigger_name));

        call sqldoc_line('table', tname, '| Timing | Event | Definer | Character Set | Collation | Created |');
        call sqldoc_line('table', tname, '| ------ | ----- | ------- | ------------- | --------- | ------- |');

        insert into tmp_docs (type, name, line)
        select 'table',
               tname,
               concat('| ', v_action_timing, ' | ', v_event_manipulation, ' | ', v_definer, ' | ',
                      v_character_set_client, ' | ', v_collation_connection, ' | ', v_created, ' |');

        call sqldoc_line('table', tname, '');
        call sqldoc_line('table', tname, '```sql');
        call sqldoc_line('table', tname, replace(v_action_statement, '\n', '\r'));
        call sqldoc_line('table', tname, '```');

    end loop triggerloop;
    close trigger_cursor;

    end if;

end$$

delimiter ;