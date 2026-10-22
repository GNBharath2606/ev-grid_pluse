# run.ps1 - Launch both FastAPI Backend and Vite Frontend servers
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Launching EV Demand Forecasting System" -ForegroundColor Cyan
Write-Host " Backend:  http://localhost:8000" -ForegroundColor Green
Write-Host " Frontend: http://localhost:5173" -ForegroundColor Green
Write-Host " Docs:     http://localhost:8000/docs" -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

# Start Backend in Background Process
$backendJob = Start-Process -FilePath "python" -ArgumentList "-m uvicorn backend.app.main:app --host 0.0.0.0 --port 8000 --reload" -PassThru

# Start Frontend in foreground
cd frontend
npm run dev
