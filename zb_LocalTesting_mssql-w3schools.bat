@echo off

setlocal

set "mssqlsource=C:\GitHub\w3schools\src\main\resources\database\mssql"
set "mssqltarget=C:\zProjects\w3schools-local\src\main\resources\database\mssql"

:: Step 1: Deleting the target folder if it exists
echo Deleting folder "%mssqltarget%" if exists...
if exist "%mssqltarget%" (
	rmdir /S /Q "%mssqltarget%" 2>nul
)
::pause

:: Step 2: Copying .sql files from source to target
echo Copying "*.sql" and "*.txt" files from "%mssqlsource%" to "%mssqltarget%"...
xcopy "%mssqlsource%\*.sql" "%mssqltarget%" /s /i /e
xcopy "%mssqlsource%\*.txt" "%mssqltarget%" /s /i /e

:: Step 3: Deleting empty folders in the mssqltarget directory
echo "Deleting Empty Folders if any of the SubFolders doesn't contain "*.sql" files...
for /f "delims=" %%G in ('dir /s /b /ad "%mssqltarget%" ^| sort /R') do (
	dir "%%G\*.sql" >nul 2>&1 || rd "%%G"
)

:: Step 4: Copy "fill_in_placeholders.sh" and "pymssql_deploy.py" to "%repoName%-%branchName%"..
:: Step 4a: Copy "fill_in_placeholders.sh" to "%repoName%-%branchName%"..
if exist "C:\GitHub\SQLsnippets\Deployment\fill_in_placeholders.sh" (
	echo Copying "fill_in_placeholders.sh" to "%mssqltarget%"...
	copy /Y "C:\GitHub\SQLsnippets\Deployment\fill_in_placeholders.sh" "%mssqltarget%" >nul 2>&1
)

:: Step 4b: Copy "pymssql_deploy.py" to "%repoName%-%branchName%\src\main\resources\database\mssql"..
if exist "C:\GitHub\SQLsnippets\Deployment\pymssql_deploy.py" (
	echo Copying "pymssql_deploy.py" to "%mssqltarget%"...
	copy /Y "C:\GitHub\SQLsnippets\Deployment\pymssql_deploy.py" "%mssqltarget%" >nul 2>&1
)
echo.
pause

:: Step 5: Execute "fill_in_placeholders.sh" in "%mssqltarget%"..
cd "%mssqltarget%"
echo Executing "fill_in_placeholders.sh" in "%mssqltarget%"...
"C:\Program Files\Git\bin\sh.exe" -c "./fill_in_placeholders.sh"
echo.

:: Step 6: Create Database If Not Exists..
cd "%mssqltarget%\0database\"
echo Creating Database "w3schools" if not exists...
sqlcmd -S "localhost" -U "karthik" -P "asdf1234" -d "master" -i "0CreateDatabase.txt" >nul 2>&1
echo.

:: Step 7: Execute "pymssql_deploy.py" in "%mssqltarget%"..
cd "%mssqltarget%"
echo Executing all SQL scripts in Folder "%mssqltarget%" using pymssql_deploy.py...
python pymssql_deploy.py --DB_HostName="localhost" --DB_UserName="karthik" --DB_Password="asdf1234" --DB_Name="w3schools"
echo.

endlocal
pause