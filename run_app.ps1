Write-Host "Starting Flutter web app in Chrome..." -ForegroundColor Green
Set-Location -Path "C:\Users\ihouzi\Desktop\Desktop\web\flutter_ar_ecommerce"
& "C:\Dev\flutter\bin\flutter.bat" run -d chrome --web-renderer html
Write-Host "Press any key to continue..."
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null 