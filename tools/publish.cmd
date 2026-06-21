@echo off
setlocal
where git >nul 2>nul
if errorlevel 1 (
  echo Git is not installed or is not available in PATH.
  exit /b 1
)

echo Enter the URL of the EMPTY GitHub repository.
echo Example: https://github.com/YOUR-USERNAME/lifeos.git
set /p REPO_URL=Repository URL: 
if "%REPO_URL%"=="" (
  echo Repository URL is required.
  exit /b 1
)

cd /d "%~dp0\.."
if not exist .git git init

git add .
git diff --cached --quiet
if errorlevel 1 (
  git commit -m "Deploy LifeOS v2.10.81"
) else (
  echo No new file changes to commit.
)

git branch -M main
git remote get-url origin >nul 2>nul
if errorlevel 1 (
  git remote add origin "%REPO_URL%"
) else (
  git remote set-url origin "%REPO_URL%"
)

git push -u origin main
if errorlevel 1 (
  echo.
  echo Push failed. Confirm the repository is empty, the URL is correct, and GitHub authentication completed.
  exit /b 1
)

echo.
echo Upload complete.
echo Now open the repository: Settings ^> Pages ^> Deploy from a branch ^> main ^> /(root) ^> Save.
endlocal
