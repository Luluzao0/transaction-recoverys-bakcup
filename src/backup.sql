# Backup
mysqldump -u username -p database_name > backup.sql

# Recovery
mysql -u username -p database_name < backup.sql


-- lembrar de trocar os nomes database_name e username