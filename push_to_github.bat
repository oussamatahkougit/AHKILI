@echo off
REM ============================================================
REM  Ahkili v3 — GitHub Push Script
REM  Run this from the Ahkili_v3 root folder
REM ============================================================

cd /d "C:\Users\USER\Desktop\work\Ahkili_v3"

REM -- 1. Initialize git if not already done
IF NOT EXIST ".git" (
    git init
    echo [OK] Git initialized
) ELSE (
    echo [OK] Git already initialized
)

REM -- 2. Create a root-level .gitignore
echo venv/ > .gitignore
echo __pycache__/ >> .gitignore
echo *.pyc >> .gitignore
echo ahkili.db >> .gitignore
echo node_modules/ >> .gitignore
echo build/ >> .gitignore
echo .env >> .gitignore
echo .env.local >> .gitignore
echo .env.production >> .gitignore
echo [OK] .gitignore created

REM -- 3. Stage everything
git add .
echo [OK] Files staged

REM -- 4. Initial commit
git commit -m "feat: initial commit — Ahkili v3 mental health platform"
echo [OK] Commit done

REM -- 5. Set branch to main
git branch -M main

REM -- 6. Add remote (EDIT THIS URL!)
REM    Replace the URL below with your actual GitHub repo URL
SET REMOTE_URL=https://github.com/YOUR_USERNAME/Ahkili_v3.git

git remote remove origin 2>nul
git remote add origin %REMOTE_URL%
echo [OK] Remote set to %REMOTE_URL%

REM -- 7. Push
git push -u origin main
echo [DONE] Pushed to GitHub!

pause
