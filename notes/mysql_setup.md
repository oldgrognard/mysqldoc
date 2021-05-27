# MySQL Notes

## Location of output
on linux versions (like in docker), mysql by default will write files to **/var/lib/mysql-files**

MySQL can't overwrite files there or delete them.  You'll need to use some other tool to manage the files once they are written.  If a file exists in mysql-files when mysql attempts to write a new copy, an error will be thrown and the process terminated.

## Granting file rights
Display the current rights on the server with:
```
show grants;
```
You have to execute:
```
grant file on *.* to 'username'@'location'
```
to allow the user to write to the mysql file folder.

Someone with super rights has to do the grant.