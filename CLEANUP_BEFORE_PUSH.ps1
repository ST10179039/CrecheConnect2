# Cleanup script - Remove unnecessary files before pushing
Write-Host "Cleaning up unnecessary files..." -ForegroundColor Cyan

# Remove Android Studio/Kotlin files
Write-Host "Removing Android Studio/Kotlin files..." -ForegroundColor Yellow
Remove-Item -Path "ByBetterCode-main" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path ".gradle" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path ".idea" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "AuthScreen.kt" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "local.properties" -Force -ErrorAction SilentlyContinue

# Remove sensitive files (if any)
Write-Host "Checking for sensitive files..." -ForegroundColor Yellow
if (Test-Path ".env") {
    Write-Host "⚠️  .env file found - make sure it's in .gitignore!" -ForegroundColor Red
}

# Remove node_modules if you want a clean push
Write-Host "Do you want to remove node_modules? (It's in .gitignore anyway)" -ForegroundColor Yellow
Write-Host "Press 'y' to remove, any other key to skip..." -ForegroundColor White
$response = Read-Host
if ($response -eq 'y' -or $response -eq 'Y') {
    Remove-Item -Path "node_modules" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "✅ node_modules removed" -ForegroundColor Green
}

Write-Host ""
Write-Host "✅ Cleanup complete!" -ForegroundColor Green
Write-Host "Now you can run RESET_GIT_HISTORY.ps1 to reset Git history" -ForegroundColor Cyan
