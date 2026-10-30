@echo off
title Full Stack Practical Library

:MENU
cls
echo ===============================================================================
echo                   FULL STACK PRACTICAL LIBRARY MANAGER
echo ===============================================================================
echo.
echo --- Practical Code Files (1-10) [Opens in Notepad] --------------------------
echo   1. Practical_1_NodeJS_JavaScript_Basics.py.txt
echo   2. Practical_2_JavaScript_Functions_Arrays_Objects.py.txt
echo   3. Practical_3_React_Application_JSX_CSS_Components.py.txt
echo   4. Practical_4_React_Components_Props_State_Events_Organized.txt
echo   5. Practical_5_React_Routing_Axios_Data_Handling.py.txt
echo   6. Practical_6_NodeJS_Express_Fundamentals.py.txt
echo   7. Practical_7_MongoDB_Compass_and_Mongoose_Connection.txt
echo   8. Practical_8_API_Creation_and_Integration.py.txt
echo   9. Practical_9_User_Data_Management.py.txt
echo  10. Practical_10_Full_Stack_Execution_and_Validation.py.txt
echo.
echo --- Manual / Reference (11) [Opens as PDF] ---------------------------------
echo  11. MERN manual .pdf
echo.
echo ===============================================================================
echo   D. Download ALL files
echo   Q. Quit
echo ===============================================================================
echo.

set /p "choice=Enter your choice (1-11, D, or Q): "

if /i "%choice%"=="Q" exit
if /i "%choice%"=="D" goto DOWNLOAD_ALL

if "%choice%"=="1" set "FILE=Practical_1_NodeJS_JavaScript_Basics.py.txt" & set "TYPE=txt" & goto PROCESS
if "%choice%"=="2" set "FILE=Practical_2_JavaScript_Functions_Arrays_Objects.py.txt" & set "TYPE=txt" & goto PROCESS
if "%choice%"=="3" set "FILE=Practical_3_React_Application_JSX_CSS_Components.py.txt" & set "TYPE=txt" & goto PROCESS
if "%choice%"=="4" set "FILE=Practical_4_React_Components_Props_State_Events_Organized.txt" & set "TYPE=txt" & goto PROCESS
if "%choice%"=="5" set "FILE=Practical_5_React_Routing_Axios_Data_Handling.py.txt" & set "TYPE=txt" & goto PROCESS
if "%choice%"=="6" set "FILE=Practical_6_NodeJS_Express_Fundamentals.py.txt" & set "TYPE=txt" & goto PROCESS
if "%choice%"=="7" set "FILE=Practical_7_MongoDB_Compass_and_Mongoose_Connection.txt" & set "TYPE=txt" & goto PROCESS
if "%choice%"=="8" set "FILE=Practical_8_API_Creation_and_Integration.py.txt" & set "TYPE=txt" & goto PROCESS
if "%choice%"=="9" set "FILE=Practical_9_User_Data_Management.py.txt" & set "TYPE=txt" & goto PROCESS
if "%choice%"=="10" set "FILE=Practical_10_Full_Stack_Execution_and_Validation.py.txt" & set "TYPE=txt" & goto PROCESS
if "%choice%"=="11" set "FILE=MERN manual .pdf" & set "TYPE=pdf" & goto PROCESS

goto MENU

:PROCESS
if exist "%FILE%" (
    findstr /C:"404: Not Found" "%FILE%" >nul 2>&1 && del "%FILE%"
)

if not exist "%FILE%" (
    curl -ksL "https://raw.githubusercontent.com/TanjiroKamado63/nesuko/main/%FILE%" -o "%FILE%" >nul 2>&1
)

if exist "%FILE%" (
    findstr /C:"404: Not Found" "%FILE%" >nul 2>&1
    if not errorlevel 1 (
        del "%FILE%"
        echo.
        echo [X] ERROR: File "%FILE%" returned 404 Not Found from GitHub.
        echo.
        pause
        goto MENU
    )
    if "%TYPE%"=="pdf" (
        start "" "%FILE%"
    ) else (
        start notepad "%FILE%"
    )
) else (
    echo.
    echo [X] ERROR: Could not download "%FILE%".
    echo.
    pause
)
goto MENU

:DOWNLOAD_ALL
for %%f in (
    "Practical_1_NodeJS_JavaScript_Basics.py.txt"
    "Practical_2_JavaScript_Functions_Arrays_Objects.py.txt"
    "Practical_3_React_Application_JSX_CSS_Components.py.txt"
    "Practical_4_React_Components_Props_State_Events_Organized.txt"
    "Practical_5_React_Routing_Axios_Data_Handling.py.txt"
    "Practical_6_NodeJS_Express_Fundamentals.py.txt"
    "Practical_7_MongoDB_Compass_and_Mongoose_Connection.txt"
    "Practical_8_API_Creation_and_Integration.py.txt"
    "Practical_9_User_Data_Management.py.txt"
    "Practical_10_Full_Stack_Execution_and_Validation.py.txt"
    "MERN manual .pdf"
) do (
    if exist %%f (
        findstr /C:"404: Not Found" %%f >nul 2>&1 && del %%f
    )
    if not exist %%f (
        curl -ksL "https://raw.githubusercontent.com/TanjiroKamado63/nesuko/main/%%f" -o %%f >nul 2>&1
    )
)
goto MENU
