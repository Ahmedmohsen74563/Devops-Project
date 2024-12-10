FROM mysql:8.0
LABEL project="vprofile"
LABEL author="ahmed mohsen"
# Copy the SQL script to initialize the database
COPY db_backup.sql /docker-entrypoint-initdb.d/db_backup.sql

# Expose the MySQL port
EXPOSE 3306