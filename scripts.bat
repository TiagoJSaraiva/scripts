@echo off
explorer %~dp0
powershell -NoExit -Command "cd '%~dp0'"
