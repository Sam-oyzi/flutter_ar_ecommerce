# Script to update gh-pages branch with the latest web build

Write-Host "Updating gh-pages branch with the latest web build..." -ForegroundColor Cyan

# Save current branch name
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "Current branch: $currentBranch" -ForegroundColor Green

# Ensure we have the latest changes
Write-Host "Fetching latest changes from remote..." -ForegroundColor Green
git fetch origin

# Build the web app with GitHub Pages settings
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

# Checkout gh-pages branch
Write-Host "Checking out gh-pages branch..." -ForegroundColor Green
git checkout gh-pages

# Pull the latest changes
Write-Host "Pulling latest changes from remote gh-pages branch..." -ForegroundColor Green
git pull origin gh-pages

# Remove old files (but keep .git and CNAME if it exists)
Write-Host "Cleaning up old files..." -ForegroundColor Green
Get-ChildItem -Path . -Exclude .git, CNAME | Remove-Item -Recurse -Force

# Copy web build files to the root
Write-Host "Copying new web build files..." -ForegroundColor Green
Copy-Item -Path .\build\web\* -Destination . -Recurse

# Add all changes
Write-Host "Adding changes to git..." -ForegroundColor Green
git add .

# Commit changes
Write-Host "Committing changes..." -ForegroundColor Green
git commit -m "Update GitHub Pages with latest web build"

# Push to GitHub
Write-Host "Pushing changes to gh-pages branch..." -ForegroundColor Green
git push origin gh-pages

# Switch back to previous branch
Write-Host "Switching back to $currentBranch branch..." -ForegroundColor Green
git checkout $currentBranch

Write-Host "GitHub Pages update complete! Your site will be available at:" -ForegroundColor Cyan
Write-Host "https://sam-oyzi.github.io/flutter_ar_ecommerce/" -ForegroundColor Yellow 