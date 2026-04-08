@echo off

if "%~1"=="" (
    echo Voce precisa passar a mensagem do commit.
    exit /b 1
)

git add .
git commit -m "%~1"
git push -u origin main