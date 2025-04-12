@echo off
echo Starting local web server for Flutter AR app...
cd build\web
echo Navigate to http://localhost:8000 in your browser
python -m http.server 8000
pause 