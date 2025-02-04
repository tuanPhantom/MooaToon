@echo off

setlocal enabledelayedexpansion

echo ^============================================================
echo ==               Updating Installation Tool               ==
echo ============================================================^


git init


set repoURL=https://github.com/JasonMa0012/MooaToon.git
set branchName=main
set PROMPT_ARGUMENT=--prompt --threads=16



:loop
git fetch --depth=50 %repoURL% %branchName%
if not %errorlevel% == 0 (
   echo Fetch failed, retrying in 5 seconds...
   timeout /t 10 /nobreak
   goto loop
)

git checkout FETCH_HEAD -f
git remote add origin %repoURL%
git pull origin %branchName%
git checkout %branchName%
git merge origin/%branchName%

echo successfully update.
timeout /t 10