@echo off

setlocal

set "mssqlsource=C:\GitHub\w3schools\src\main\resources\database\mssql"
set "mssqltarget=C:\zProjects\w3schools-local\src\main\resources\database\mssql"

:: Step 1: Deleting the target folder if it exists
echo Deleting folder "%mssqltarget%" if exists...
rmdir /S /Q "%mssqltarget%" 2>nul
::pause

:: Step 2: Copying .sql files from source to target
echo Copying "*.sql" files from "%mssqlsource%" to "%mssqltarget%"...
xcopy "%mssqlsource%\*.sql" "%mssqltarget%" /s /i /e

:: Step 3: Deleting empty folders in the mssqltarget directory
echo "Deleting Empty Folders if any of the SubFolders doesnot contain "*.sql" files...
for /f "delims=" %%G in ('dir /s /b /ad "%mssqltarget%" ^| sort /R') do (
	dir "%%G\*.sql" >nul 2>&1 || rd "%%G"
)

:: Step 4: Copy "fill_in_placeholders.sh" and "pymssql_deploy.py" to "%repoName%-%branchName%"..
:: Step 4a: Copy "fill_in_placeholders.sh" to "%repoName%-%branchName%"..
if exist "C:\GitHub\SQLsnippets\Deployment\fill_in_placeholders.sh" (
	echo Copying "fill_in_placeholders.sh" to "%mssqltarget%"...
	copy /Y "C:\GitHub\SQLsnippets\Deployment\fill_in_placeholders.sh" "%mssqltarget%"
)
:: Step 4b: Copy "pymssql_deploy.py" to "%repoName%-%branchName%\src\main\resources\database\mssql"..
if exist "C:\GitHub\SQLsnippets\Deployment\pymssql_deploy.py" (
	echo Copying "pymssql_deploy.py" to "%mssqltarget%"...
	copy /Y "C:\GitHub\SQLsnippets\Deployment\pymssql_deploy.py" "%mssqltarget%"
)
echo.
pause

cd "C:\zProjects\w3schools-local\src\main\resources\database\mssql\"
fill_in_placeholders.sh
echo.

cd "C:\zProjects\w3schools-local\src\main\resources\database\mssql"
echo Executing all SQL scripts in Folder "C:\zProjects\w3schools-local\src\main\resources\database\mssql" using pymssql_deploy.py...
python pymssql_deploy.py --DB_HostName="localhost" --DB_UserName="karthik" --DB_Password="asdf1234" --DB_Name="w3schools"
echo.

endlocal
::pause