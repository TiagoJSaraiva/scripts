@echo off
cd /d C:\MoneyPrinter\MoneyPrinterTurbo
docker compose -f docker-compose.release.yml up -d
pause
