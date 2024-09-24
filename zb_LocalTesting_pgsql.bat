@echo off

setlocal

set "pgsqlsource=C:\GitHub\w3schools\src\main\resources\database\pgsql"
set "pgsqltarget=C:\zProjects\w3schools-local\src\main\resources\database\pgsql"

:: Step 1: Deleting the target folder if it exists
echo Deleting folder "%pgsqltarget%" if exists...
rmdir /S /Q "%pgsqltarget%" 2>nul
::pause

:: Step 2: Copying .sql files from source to target
echo Copying "*.sql" files from "%pgsqlsource%" to "%pgsqltarget%"...
xcopy "%pgsqlsource%\*.sql" "%pgsqltarget%" /s /i /e

:: Step 3: Deleting empty folders in the pgsqltarget directory
echo "Deleting Empty Folders if any of the SubFolders doesnot contain "*.sql" files...
for /f "delims=" %%G in ('dir /s /b /ad "%pgsqltarget%" ^| sort /R') do (
	dir "%%G\*.sql" >nul 2>&1 || rd "%%G"
)

:: Step 4: Copy "fill_in_placeholders.sh" and "pypgsql_deploy.py" to "%repoName%-%branchName%"..
:: Step 4a: Copy "fill_in_placeholders.sh" to "%repoName%-%branchName%"..
if exist "C:\GitHub\SQLsnippets\Deployment\fill_in_placeholders.sh" (
	echo Copying "fill_in_placeholders.sh" to "%pgsqltarget%"...
	copy /Y "C:\GitHub\SQLsnippets\Deployment\fill_in_placeholders.sh" "%pgsqltarget%"
)
:: Step 4b: Copy "pypgsql_deploy.py" to "%repoName%-%branchName%\src\main\resources\database\pgsql"..
if exist "C:\GitHub\SQLsnippets\Deployment\pypgsql_deploy.py" (
	echo Copying "pypgsql_deploy.py" to "%pgsqltarget%"...
	copy /Y "C:\GitHub\SQLsnippets\Deployment\pypgsql_deploy.py" "%pgsqltarget%"
)
echo.
pause

cd "C:\zProjects\w3schools-local\src\main\resources\database\pgsql\"
fill_in_placeholders.sh
echo.

cd "C:\zProjects\w3schools-local\src\main\resources\database\pgsql"
echo Executing all SQL scripts in Folder "C:\zProjects\w3schools-local\src\main\resources\database\pgsql" using pypgsql_deploy.py...
python pypgsql_deploy.py --DB_HostName="localhost" --DB_Port="5432" --DB_UserName="karthik" --DB_Password="asdf1234" --DB_Name="w3schools"
echo.

endlocal
::pause