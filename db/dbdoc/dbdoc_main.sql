DROP procedure IF EXISTS `dbdocs`;
DELIMITER $$
CREATE
	PROCEDURE dbdocs()
BEGIN

	DECLARE table_cursor_finished int DEFAULT 0;
	DECLARE tname varchar(64);

	DECLARE table_cursor CURSOR FOR
		SELECT table_name
		FROM information_schema.TABLES
		WHERE table_schema = DATABASE()
		and table_name <> 'tmp_docs';
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET table_cursor_finished = 1;

	DROP TABLE if exists tmp_docs;

	CREATE TABLE tmp_docs
	(
		id   int AUTO_INCREMENT,
		line varchar(4000) DEFAULT '' NULL,
		CONSTRAINT tmp_docs_pk
			PRIMARY KEY (id)
	);

	INSERT INTO tmp_docs (line) VALUES (CONCAT('# ', DATABASE(), ' Data Dictionary'));
	INSERT INTO tmp_docs (line) VALUES ('## Tables');

	OPEN table_cursor;

	tableLoop:
	LOOP
		FETCH table_cursor INTO tname;
		IF table_cursor_finished = 1
		THEN
			LEAVE tableLoop;
		END IF;

		INSERT INTO tmp_docs (line) VALUES (CONCAT('### ', tname));

		INSERT INTO tmp_docs (line) values
	    ('| key  | Column | Type        | Default | Null | Comment |'),
		('| ---- | ------ | ----------- | ------- | ---- | ------- |');

		insert into tmp_docs (line)
		select concat(
		    '| | ',
		    column_name,
		    ' | ',
		    column_type,
		    ' | ',
		    ifnull(column_default,''),
		    ' | ',
		    IS_NULLABLE,
		    ' | ',
		    COLUMN_COMMENT,
		    ' |'
			)
		from information_schema.columns
		where table_schema = database()
		and table_name = 'ActionStepList'
		order by ORDINAL_POSITION;


	END LOOP tableLoop;


	SELECT line
	FROM tmp_docs
	ORDER BY id
	INTO OUTFILE '/var/lib/mysql-files/dbdocs.md'
		LINES TERMINATED BY '\n';

END$$

DELIMITER ;

call dbdocs();