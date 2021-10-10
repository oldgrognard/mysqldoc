# mysqldoc

Some stored procedures to document your database in markdown.

## Installation

Still a work in progress

## Usage
``` sql
call mysqldoc_main(export: boolean, diagrams: boolean, path: null or string);
examples: 
call mysqldoc_main(true, true, null); // path defaults to '/var/lib/mysql-files'
call mysqldoc_main(true, false, '/some/non/standard/path/mysql-files/');
```
### Path parameter 
The path parameter is the full path to the writable directory on
the server hosting MySQL.  There is no provision for sending output to the client.

### Destination directory
MySQL will not overwrite existing files.  If you need to generate the documentation
more than once, you'll need to make sure generated files do not already exist.

### Setting up MySQL
MySql can write files to disk, which is w