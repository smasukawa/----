@echo off
powershell .\�s���W�v.ps1
if %ERRORLEVEL% NEQ 0 goto FAILURE
goto END

:FAILURE
echo ERROR STOP: %ERRORLEVEL%
pause

:END
echo �s���W�v���������܂���
pause
exit