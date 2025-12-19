@echo off
setlocal enabledelayedexpansion

:: Step 1: Delete xyplorer64_full_noinstall.zip if it exists in "C:\GitHub\w3schools\xyplorer" folder
echo Deleting any files "xyplorer64_full_noinstall*.zip" in specified folders...
for %%P in (
    "C:\GitHub\w3schools\xyplorer"
    "C:\Users\%USERNAME%\Downloads"
    "C:\Users\%USERNAME%\Downloads\Compressed"
) do (
    if exist "%%P\xyplorer64_full_noinstall*.zip" (
        del /Q "%%P\xyplorer64_full_noinstall*.zip"
        echo Deleted "xyplorer64_full_noinstall*.zip" from %%P
    )
)
echo.

:: Step 2: Download "xyplorer64_full_noinstall.zip" file from XYplorer Website
echo URL: https://www.xyplorer.com/download/xyplorer64_full_noinstall.zip
echo File "xyplorer64_full_noinstall.zip" will be downloaded automatically...
start "" "https://www.xyplorer.com/download.php?bit=64"
start "" "https://www.xyplorer.com/download/xyplorer64_full_noinstall.zip"

:check_download
if not exist "C:\Users\%USERNAME%\Downloads\xyplorer64_full_noinstall.zip" (
    if not exist "C:\Users\%USERNAME%\Downloads\Compressed\xyplorer64_full_noinstall.zip" (
        echo Waiting for file "xyplorer64_full_noinstall.zip" to complete download...
        timeout /t 5 /nobreak >nul
        goto check_download
    )
)
echo File "xyplorer64_full_noinstall.zip" downloaded Successfully...
echo.

:: Step 3: Copy the downloaded file "xyplorer64_full_noinstall.zip" to Location "C:\GitHub\w3schools\xyplorer"
for %%D in (
    "C:\Users\%USERNAME%\Downloads"
    "C:\Users\%USERNAME%\Downloads\Compressed"
) do (
    if exist "%%~D\xyplorer64_full_noinstall.zip" (
        echo Copying file "xyplorer64_full_noinstall.zip" from "%%~D" to "C:\GitHub\w3schools\xyplorer"...
        copy /Y "%%~D\xyplorer64_full_noinstall.zip" "C:\GitHub\w3schools\xyplorer\xyplorer64_full_noinstall.zip"
        echo File "xyplorer64_full_noinstall.zip" copied Successfully to "C:\GitHub\w3schools\xyplorer"...
        endlocal
    )
)

timeout /t 5
endlocal
exit /b 0