@echo off
setlocal enabledelayedexpansion

set "PORT=%~1"

if "%PORT%"=="" (
    echo Uso: killport 3000
    exit /b 1
)

set "PID="

for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":%PORT%" ^| findstr "LISTENING"') do (
    set "PID=%%a"
)

if "%PID%"=="" (
    echo Nenhum processo LISTENING encontrado na porta %PORT%.
    exit /b 0
)

set "PROCESS_NAME="

for /f "skip=3 tokens=1" %%a in ('tasklist /FI "PID eq %PID%"') do (
    set "PROCESS_NAME=%%a"
    goto :found_process
)

:found_process

echo.
echo Porta....: %PORT%
echo PID......: %PID%
echo Processo.: %PROCESS_NAME%
echo.

set /p "CONFIRM=Esse é o processo certo para encerrar? (S/N): "

if /I "%CONFIRM%"=="S" (
    echo Encerrando processo...
    taskkill /F /PID %PID%
    echo Concluido.
    exit /b 0
)

if /I "%CONFIRM%"=="N" (
    echo Operacao cancelada.
    exit /b 0
)

echo Opcao invalida. Operacao cancelada.
exit /b 1
