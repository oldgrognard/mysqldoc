DROP PROCEDURE IF EXISTS `sqldoc_toc`;
DELIMITER $$
CREATE PROCEDURE sqldoc_toc()
BEGIN

    call sqldoc_line('toc', 'toc', concat('# DATABASE', DATABASE()));
    call sqldoc_line('toc', 'toc', '__Data Dictionary__');
    call sqldoc_line('toc', 'toc', '## Table of Contents');
    call sqldoc_line('toc', 'toc', '### Tables');
    call sqldoc_line('toc', 'toc', '| Name | Comment | Row Count|');
    call sqldoc_line('toc', 'toc', '| ---- | ------- | ---------: |');

    INSERT INTO tmp_docs (type, name, line)
    SELECT 'toc', 'toc', CONCAT('| [', table_name, '](table_', table_name, '.md) | ', table_comment, ' | ', table_rows, ' |')
      FROM information_schema.tables
     WHERE table_schema = DATABASE()
       AND table_type = 'BASE TABLE'
       AND table_name <> 'tmp_docs';

END$$

DELIMITER ;
