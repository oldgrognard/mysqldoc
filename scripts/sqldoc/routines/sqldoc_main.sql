DROP PROCEDURE IF EXISTS `sqldoc_main`;
DELIMITER $$
CREATE PROCEDURE sqldoc_main(
    IN export boolean
)
BEGIN

    DROP TABLE IF EXISTS tmp_docs;

    CREATE TABLE tmp_docs
        (
            id int AUTO_INCREMENT,
            doc varchar(200) NOT NULL DEFAULT 'toc',
            line varchar(4000) CHARSET utf8mb4 DEFAULT '' NULL,
            CONSTRAINT tmp_docs_pk
                PRIMARY KEY (id)
        );

    CALL sqldoc_toc();
    CALL sqldoc_tables();

    IF (export = TRUE) THEN CALL sqldoc_export(); END IF;
END;
$$

DELIMITER ;