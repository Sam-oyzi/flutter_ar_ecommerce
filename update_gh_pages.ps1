# Script to update gh-pages branch with the latest web build

Write-Host "=== GITHUB PAGES DEPLOYMENT UTILITY ===" -ForegroundColor Cyan
Write-Host ""

# Check if build/web exists
if (-not (Test-Path "build/web")) {
    Write-Host "Error: The 'build/web' directory doesn't exist." -ForegroundColor Red
    Write-Host "This script requires your Flutter web build to already be generated." -ForegroundColor Red
    Write-Host "Please run 'flutter build web --release' first, then run this script again." -ForegroundColor Yellow
    exit 1
}

# Save current branch name
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "Current branch: $currentBranch" -ForegroundColor Green

# Ensure we have the latest changes
Write-Host "Fetching latest changes from remote..." -ForegroundColor Green
git fetch origin

# Fix base href in index.html for GitHub Pages
Write-Host "Setting base href for GitHub Pages..." -ForegroundColor Green
$indexPath = "build\web\index.html"
$content = Get-Content -Path $indexPath
$content = $content -replace '<base href=".*">', '<base href="/flutter_ar_ecommerce/">'
Set-Content -Path $indexPath -Value $content

# Create .nojekyll file
Write-Host "Creating .nojekyll file..." -ForegroundColor Green
Set-Content -Path "build\web\.nojekyll" -Value ""

# Stash any changes in the current workspace
Write-Host "Stashing any current changes..." -ForegroundColor Green
git stash push -m "Temporary stash for GitHub Pages deployment"

try {
    # Checkout gh-pages branch
    Write-Host "Checking out gh-pages branch..." -ForegroundColor Green
    git checkout gh-pages

    # Pull the latest changes
    Write-Host "Pulling latest changes from remote gh-pages branch..." -ForegroundColor Green
    git pull origin gh-pages

    # Remove old files (but keep .git and CNAME if it exists)
    Write-Host "Cleaning up old files..." -ForegroundColor Green
    Get-ChildItem -Path . -Exclude .git, CNAME, .gitignore | ForEach-Object {
        if (Test-Path $_) {
            Remove-Item -Path $_ -Recurse -Force
        }
    }

    # Copy web build files to the root
    Write-Host "Copying new web build files..." -ForegroundColor Green
    Copy-Item -Path ".\build\web\*" -Destination "." -Recurse

    # Add all changes
    Write-Host "Adding changes to git..." -ForegroundColor Green
    git add .

    # Commit changes
    Write-Host "Committing changes..." -ForegroundColor Green
    git commit -m "Update GitHub Pages with latest web build"

    # Push to GitHub
    Write-Host "Pushing changes to gh-pages branch..." -ForegroundColor Green
    git push origin gh-pages

    Write-Host "GitHub Pages update complete!" -ForegroundColor Cyan
    Write-Host "Your site will be available at:" -ForegroundColor Cyan
    Write-Host "https://sam-oyzi.github.io/flutter_ar_ecommerce/" -ForegroundColor Yellow
}
catch {
    Write-Host "Error updating GitHub Pages: $_" -ForegroundColor Red
}
finally {
    # Switch back to previous branch
    Write-Host "Switching back to $currentBranch branch..." -ForegroundColor Green
    git checkout $currentBranch

    # Apply stashed changes if any
    $stashList = git stash list
    if ($stashList -match "Temporary stash for GitHub Pages deployment") {
        Write-Host "Applying stashed changes..." -ForegroundColor Green
        git stash pop
    }
} 