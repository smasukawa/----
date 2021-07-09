@echo off
powershell .\行数集計.ps1
if %ERRORLEVEL% NEQ 0 goto FAILURE
goto END

:FAILURE
echo ERROR STOP: %ERRORLEVEL%
pause

:END
echo 行数集計が完了しました
pause
exit