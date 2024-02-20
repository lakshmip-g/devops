#!/bin/bash

# Postgres DB connection parameters
PSQL_USER="This is the postgres username"
PSQL_PASS="This is the postgres password"
PSQL_DB="This is schema/database name "
PSQL_HOST="This is the database host name"
PSQL_PORT="This is the port number"
SCHEMA_NAME="This is your schema name"

# Postgres Function name
FUNCTION_NAME="This is the postgres database function name"

# Print the time of the execution
echo "Executing the stored procedure at Time: date"

result=$(
  PGPASSWORD="$PSQL_PASS" /usr/bin/psql -h "$PSQL_HOST" -U "$PSQL_USER" -p "$PSQL_PORT" -d "$PSQL_DB" -t -A -c "SELECT \"$SCHEMA_NAME\".\"$FUNCTION_NAME\"();"
)

# Check for errors during command execution
if [ $? -ne 0 ]; then
  echo "Error executing PostgreSQL query. Check logs for details."
fi

# print the value returned
echo "Result value = $result."

if [ "$result" != 0 ]; then
    echo "The output is non-zero and the value is = $result." | /usr/bin/mail -s "Your custom message" <your email ID>
else
    echo "The output is ZERO"
fi