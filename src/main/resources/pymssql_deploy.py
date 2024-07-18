import pymssql
import logging
import os
import io
import argparse
import collections
from os.path import dirname, abspath

# Parse command line args
parser = argparse.ArgumentParser()
parser.add_argument('--ROLE_PATH', help='Current role path')
parser.add_argument('--SQL_HOST_NAME_UC', help='SQL Database host name in the hostname and instance format')
parser.add_argument('--SQL_LOGIN_NAME_UC', help='SQL Login Name')
parser.add_argument('--SQL_LOGIN_PWD_UC', help='SQL Login Password')
parser.add_argument('--DATABASE_NAME_UC', help='Database Name')

args = parser.parse_args()
logging.basicConfig(filename='sql_script.log', level=logging.DEBUG)

# Current python script path, sql scripts are assumed to be in the same dir
script_path = os.getcwd()
# Map the script dirs and files
sqlDirsToFilesMap = {}
if os.path.exists(script_path):
    for dir in os.listdir(script_path):
        full_path = os.path.join(script_path, dir)
        if os.path.isdir(full_path):
            sqlFiles = []
            for file in os.listdir(full_path):
                if file.endswith(".sql"):
                    sqlFiles.append(os.path.join(full_path, file))
            sqlFiles.sort()
            sqlDirsToFilesMap[full_path] = sqlFiles

    # To run the script is the given order. The directories and scripts are sorted alphabetically in ascending order
    ordered_dirs = collections.OrderedDict(sorted(sqlDirsToFilesMap.items()))

    logging.info("Scripts will be executed in the following order: \n")
    try:
        conn = pymssql.connect(host=args.SQL_HOST_NAME_UC, user=args.SQL_LOGIN_NAME_UC, password=args.SQL_LOGIN_PWD_UC, database=args.DATABASE_NAME_UC)
        logging.info("Database connection successful to server: %s on database: %s \n", args.SQL_HOST_NAME_UC, args.DATABASE_NAME_UC)

        try:
            cursor = conn.cursor()
            logging.info("")  # Empty line
            logging.info("Step 1: Executing SQL Scripts")
            for dir in ordered_dirs:
                logging.info("")  # Empty line
                logging.info("Step 2: Executing SQL Scripts in Folder: %s", dir)
                for file in ordered_dirs[dir]:
                    logging.info("Executing script: %s", file)
                    with io.open(file, 'r', encoding='utf-8-sig') as f:
                        sql_to_execute = ''
                        for line in f:
                            if line.strip().upper() == 'GO':
                                if sql_to_execute.strip() != '':
                                    cursor.execute(sql_to_execute)
                                    #conn.commit()  # Commit after each SQL command
                                    sql_to_execute = ''
                            else:
                                sql_to_execute = str(sql_to_execute) + line
                        # For a script that doesn't have GO statements all, or as a last line
                        if sql_to_execute != '':
                            cursor.execute(sql_to_execute)
                            #conn.commit()  # Commit after each SQL command
                    # print(f"Successfully Executed: {file}")  # Print statement for successful execution
            conn.commit()  # Finally Committing after all SQL commands
            logging.info("")  # Empty line
            logging.info("Finally Committing...")

        except Exception as e:
            # Handling errors that occur during the execution of SQL scripts
            conn.rollback()  # Rollback in case of errors
            logging.info("")  # Empty line
            logging.error("Error occurred while executing the sql script", exc_info=True)

        finally:
            # Ensuring proper cleanup by closing the cursor and the database connection
            cursor.close()  # Closing the cursor
            conn.close()  # Closing the connection
            logging.info("")  # Empty line
            logging.info("Cursor and Database Connection Closed....")

    except Exception as e:
        # Handling errors related to acquiring a connection to the database
        logging.info("")  # Empty line
        logging.error("Failed to acquire a connection to the database", exc_info=True)
else:
    logging.info("No sql scripts to execute")