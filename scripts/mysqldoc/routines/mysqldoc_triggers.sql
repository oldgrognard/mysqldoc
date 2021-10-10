drop procedure if exists `mysqldoc_triggers`;
delimiter $$
create procedure mysqldoc_triggers(
    in _tname varchar(64)
)
begin
    declare _trigger_cursor_finished int default 0;
    declare _trigger_name varchar(64);
    declare _event_manipulation, _action_timing varchar(6);
    declare _action_statement longtext;
    declare _created datetime(2);
    declare _definer varchar(93);
    declare _character_set_client, _collation_connection varchar(32);

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
                                        and EVENT_OBJECT_TABLE = _tname;

    declare continue handler for not found set _trigger_cursor_finished = 1;

    set @trigger_count = ( select count(*)
                          from information_schema.triggers
                          where EVENT_OBJECT_SCHEMA = database() and EVENT_OBJECT_TABLE = _tname
    );

    if @trigger_count > 0 then

    call mysqldoc_line('table', _tname, '');
    call mysqldoc_line('table', _tname, '## Triggers');

    open trigger_cursor;

    triggerloop:
    loop

        fetch trigger_cursor into _trigger_name, _action_timing, _event_manipulation, _definer, _character_set_client, _collation_connection, _created, _action_statement;
        if _trigger_cursor_finished = 1 then leave triggerloop; end if;

        call mysqldoc_line('table', _tname, concat('### ', _trigger_name));

        call mysqldoc_line('table', _tname, '| Timing | Event | Definer | Character Set | Collation | Created |');
        call mysqldoc_line('table', _tname, '| ------ | ----- | ------- | ------------- | --------- | ------- |');

        insert into mysqldoc_temp_docs (type, name, line)
        select 'table',
               _tname,
               concat('| ', _action_timing, ' | ', _event_manipulation, ' | ', _definer, ' | ',
                      _character_set_client, ' | ', _collation_connection, ' | ', _created, ' |');

        call mysqldoc_line('table', _tname, '');
        call mysqldoc_line('table', _tname, '```sql');
        call mysqldoc_line('table', _tname, replace(_action_statement, '\n', '\r'));
        call mysqldoc_line('table', _tname, '```');

    end loop triggerloop;
    close trigger_cursor;

    end if;

end$$

delimiter ;