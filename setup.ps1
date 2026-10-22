# setup.ps1 - Automated setup script for EV Charging Demand Forecasting System
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " EV Charging Demand Forecasting - Automated Setup" -ForegroundColor Cyan
Write-Host " Dept. of CSE • Academic Year 2026-2027" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Install Python Backend Dependencies
Write-Host "`n[1/4] Installing Python dependencies..." -ForegroundColor Yellow
pip install -r backend/requirements.txt

# 2. Run Data Ingestion & Preprocessing
Write-Host "`n[2/4] Ingesting Caltech ACN data & Open-Meteo weather..." -ForegroundColor Yellow
python ml/download_data.py
python ml/preprocess.py
python ml/feature_engineering.py

# 3. Train all 7 ML Models & Benchmark on Test Set
Write-Host "`n[3/4] Training and benchmarking all 7 ML models..." -ForegroundColor Yellow
python ml/train.py

# 4. Install Frontend NPM Packages & Build
Write-Host "`n[4/4] Setting up React + Vite frontend..." -ForegroundColor Yellow
cd frontend
npm install
npm run build
cd ..

Write-Host "`n==========================================================" -ForegroundColor Green
Write-Host " Setup Complete! Run .\run.ps1 to start the application." -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
