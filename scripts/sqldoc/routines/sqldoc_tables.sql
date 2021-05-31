DROP PROCEDURE IF EXISTS `sqldoc_tables`;
DELIMITER $$
CREATE PROCEDURE sqldoc_tables()
BEGIN

    DECLARE table_cursor_finished int DEFAULT 0;
    DECLARE tname varchar(64);
    DECLARE tcomment varchar(2048);

    DECLARE table_cursor CURSOR FOR SELECT table_name, table_comment
                                      FROM information_schema.tables
                                     WHERE table_schema = DATABASE()
                                       AND table_type = 'BASE TABLE'
                                       AND table_name <> 'tmp_docs';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET table_cursor_finished = 1;

    INSERT INTO tmp_docs (doc, line) VALUES ('toc', '### Tables');
    INSERT INTO tmp_docs (doc, line) VALUES ('toc', '&#128273; = primary key');
    INSERT INTO tmp_docs (doc, line) VALUES ('toc', '&#128477; = foreign key');

    OPEN table_cursor;

    tableloop:
    LOOP
        FETCH table_cursor INTO tname, tcomment;
        IF table_cursor_finished = 1 THEN LEAVE tableloop; END IF;

        INSERT INTO tmp_docs (doc, line) VALUES (CONCAT('table_', tname), CONCAT('#### ', tname));
        IF tcomment <> '' THEN INSERT INTO tmp_docs (doc, line) VALUES (CONCAT('table_', tname), tcomment); END IF;

        INSERT INTO tmp_docs (doc, line)
        VALUES (CONCAT('table_', tname), '| Key  | Column | Type        | Default | Nullable | Comment |'),
               (CONCAT('table_', tname), '| ---- | ------ | ----------- | ------- | -------- | ------- |');

        INSERT INTO tmp_docs (doc, line)
        SELECT CONCAT('table_', tname),
               CONCAT('| ', CASE WHEN column_key LIKE '%PRI%' THEN '&#128273;'
                                 WHEN column_key LIKE '%MUL%' THEN '&#128477;'
                                 ELSE '' END, ' | ', column_name, ' | ', column_type, ' | ',
                      IF(column_default = '', 'empty string', IFNULL(column_default, '')), ' | ',
                      IF(is_nullable = 'NO', '&#128683;', '&#9989;'), ' | ', column_comment, ' |')
          FROM information_schema.columns
         WHERE table_schema = DATABASE()
           AND table_name = tname
         ORDER BY ordinal_position;


    END LOOP tableloop;

END$$

DELIMITER ;