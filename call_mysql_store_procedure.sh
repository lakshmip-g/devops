#!/bin/bash

# MySQL connection parameters
MYSQL_USER="This is the user name for the database host"
MYSQL_PASS="This is the password for the database host"
MYSQL_DB="This is your schema/database name"
MYSQL_HOST="This is your Database host name"

# Stored procedure details
PROCEDURE_NAME="This is your stored procedure name"

# Print the time of the execution
echo "Executing the stored procedure at Time: date"

# Call the stored procedure
/usr/bin/mysql -u"$MYSQL_USER" -p"$MYSQL_PASS" -h"$MYSQL_HOST" "$MYSQL_DB" -e "CALL $PROCEDURE_NAME;"

# Capture the exit status
EXIT_STATUS=$?

# Check if the command was successful
if [ $EXIT_STATUS -eq 0 ]; then
    echo "Stored procedure executed successfully."
else
    echo "Failed to execute the stored procedure. Exit status: $EXIT_STATUS"
fi