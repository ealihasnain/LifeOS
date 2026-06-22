@echo off
setlocal
cd /d "%~dp0\.."

where git >nul 2>nul
if errorlevel 1 (
  echo Git is not installed or is not available in PATH.
  pause
  exit /b 1
)

git rev-parse --is-inside-work-tree >nul 2>nul
if errorlevel 1 (
  echo This folder is not your cloned GitHub repository.
  echo Extract the update directly into the repository root, then run this file again.
  pause
  exit /b 1
)

echo Checking changed files...
git status --short

git add index.html guide.html sw.js README.md tools\push-guide-update.cmd

git diff --cached --quiet
if not errorlevel 1 (
  echo No guide update changes are waiting to be committed.
  pause
  exit /b 0
)

git commit -m "Add LifeOS full user guide and fix offline navigation"
if errorlevel 1 (
  echo Commit failed.
  pause
  exit /b 1
)

git push origin main
if errorlevel 1 (
  echo Push failed. Check your internet connection, GitHub authentication, branch and remote URL.
  pause
  exit /b 1
)

echo.
echo Update pushed successfully.
echo GitHub Pages should redeploy automatically from the main branch.
pause
endlocal
