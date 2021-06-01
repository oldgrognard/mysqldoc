DROP PROCEDURE IF EXISTS `sqldoc_toc`;
DELIMITER $$
CREATE PROCEDURE sqldoc_toc()
BEGIN

    INSERT INTO tmp_docs (doc, line)
    VALUES ('toc', CONCAT('# DATABASE: ', DATABASE())),
           ('toc', '__Data Dictionary__'),
           ('toc', '## Table of Contents'),
           ('toc', '### Tables'),
           ('toc', '| Name | Comment | Row Count|'),
           ('toc', '| ---- | ------- | ---------: |');


    INSERT INTO tmp_docs (doc, line)
    SELECT 'toc', CONCAT('| [', table_name, '](table_', table_name, '.md) | ', table_comment, ' | ', table_rows, ' |')
      FROM information_schema.tables
     WHERE table_schema = DATABASE()
       AND table_type = 'BASE TABLE'
       AND table_name <> 'tmp_docs';

END$$

DELIMITER ;
