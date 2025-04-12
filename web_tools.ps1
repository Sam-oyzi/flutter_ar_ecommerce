# AR Furniture Web Tools

function Build-For-Local {
    Write-Host "Building for local testing..." -ForegroundColor Cyan
    
    # Clean the Flutter build
    Write-Host "Cleaning Flutter build..." -ForegroundColor Green
    flutter clean
    
    # Get dependencies
    Write-Host "Getting dependencies..." -ForegroundColor Green
    flutter pub get
    
    # Build for web with local base href
    Write-Host "Building web app for local testing..." -ForegroundColor Green
    flutter build web --release
    
    # Fix base href in index.html for local testing
    Write-Host "Setting base href for local testing..." -ForegroundColor Green
    $indexPath = "build\web\index.html"
    $content = Get-Content -Path $indexPath
    $content = $content -replace '<base href=".*">', '<base href="/">'
    Set-Content -Path $indexPath -Value $content
    
    Write-Host "Local build complete!" -ForegroundColor Cyan
    Write-Host "Run 'Start-LocalServer' to test locally" -ForegroundColor Yellow
}

function Start-LocalServer {
    Write-Host "Starting local web server..." -ForegroundColor Cyan
    
    $webDir = "build\web"
    if (-not (Test-Path $webDir)) {
        Write-Host "Web build not found! Run Build-For-Local first." -ForegroundColor Red
        return
    }
    
    # Change to the web directory
    Set-Location $webDir
    
    # Start the Python HTTP server
    Write-Host "Server started at http://localhost:8000" -ForegroundColor Green
    Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
    python -m http.server 8000
}

function Build-For-GitHub {
    Write-Host "Building for GitHub Pages..." -ForegroundColor Cyan
    
    # Clean the Flutter build
    Write-Host "Cleaning Flutter build..." -ForegroundColor Green
    flutter clean
    
    # Get dependencies
    Write-Host "Getting dependencies..." -ForegroundColor Green
    flutter pub get
    
    # Build for web
    Write-Host "Building web app for GitHub Pages..." -ForegroundColor Green
    flutter build web --release
    
    # Fix base href in index.html for GitHub Pages
    Write-Host "Setting base href for GitHub Pages..." -ForegroundColor Green
    $indexPath = "build\web\index.html"
    $content = Get-Content -Path $indexPath
    $content = $content -replace '<base href=".*">', '<base href="/flutter_ar_ecommerce/">'
    Set-Content -Path $indexPath -Value $content
    
    # Create .nojekyll file
    Write-Host "Creating .nojekyll file..." -ForegroundColor Green
    Set-Content -Path "build\web\.nojekyll" -Value ""
    
    Write-Host "GitHub Pages build complete!" -ForegroundColor Cyan
    Write-Host "Upload the contents of the 'build/web' directory to your GitHub repository's gh-pages branch." -ForegroundColor Yellow
}

# Display a menu
function Show-Menu {
    Clear-Host
    Write-Host "===== AR Furniture Web Tools =====" -ForegroundColor Cyan
    Write-Host
    Write-Host "1: Build for local testing" -ForegroundColor Green
    Write-Host "2: Start local web server" -ForegroundColor Green
    Write-Host "3: Build for GitHub Pages" -ForegroundColor Green
    Write-Host "Q: Quit" -ForegroundColor Red
    Write-Host
}

# Menu loop
function Start-Menu {
    do {
        Show-Menu
        $choice = Read-Host "Enter your choice"
        
        switch ($choice) {
            "1" { 
                Build-For-Local
                Pause
            }
            "2" { 
                Start-LocalServer
                # No pause needed as server will be running
            }
            "3" { 
                Build-For-GitHub
                Pause
            }
            "q" { 
                return 
            }
            default {
                Write-Host "Invalid choice, try again." -ForegroundColor Red
                Pause
            }
        }
    } until ($choice -eq "q")
}

# Start the menu
Start-Menu 