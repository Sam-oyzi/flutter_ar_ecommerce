@echo off
echo Starting Flutter web app in Chrome...
cd C:\Users\ihouzi\Desktop\Desktop\web\flutter_ar_ecommerce
call C:\Dev\flutter\bin\flutter clean
call C:\Dev\flutter\bin\flutter pub get
call C:\Dev\flutter\bin\flutter run -d chrome --web-renderer html
pause 