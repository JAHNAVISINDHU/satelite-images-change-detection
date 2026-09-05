@echo off
title Satellite Change Detection - Starting...
cd /d "%~dp0"

echo.
echo  ============================================
echo   Satellite Images Change Detection App
echo  ============================================
echo.

echo [~] Cleaning up unnecessary training and dataset files...
if exist "inspect_db.py" del /q /f "inspect_db.py"
if exist "train_colab.py" del /q /f "train_colab.py"
if exist "static\synthetic_dataset" rmdir /s /q "static\synthetic_dataset"
echo [~] Cleanup complete.
echo.

REM Try venv python first, then system python
if exist "venv\Scripts\python.exe" (
    echo  [OK] Using virtual environment Python
    echo  [>>] Starting Flask server...
    echo.
    echo  >>> Open your browser at: http://127.0.0.1:5000
    echo.
    venv\Scripts\python.exe app.py
) else if exist "venv\Scripts\python3.exe" (
    echo  [OK] Using virtual environment Python3
    venv\Scripts\python3.exe app.py
) else (
    echo  [!!] venv not found, trying system Python...
    python app.py
)

echo.
echo  Server stopped. Press any key to exit.
pause >nul
