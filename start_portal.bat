@echo off
title Nadeem IT Knowledge Base V19
cd /d %~dp0
echo Starting V19 Online Edition...
start "" http://localhost:3019
node server.js
pause
