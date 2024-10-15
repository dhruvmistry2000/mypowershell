function Install-Packages {
    Write-Host "Checking if winget is installed..." -ForegroundColor Green
    if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Host "Winget is not installed. Installing it now..." -ForegroundColor Green
        iex "Invoke-WebRequest -Uri https://aka.ms/installwinget -UseBasicParsing"
    }
    Write-Host "Winget is installed. Installing packages..." -ForegroundColor Green
    winget import -i .\packages.json
    Write-Host "Packages installed successfully." -ForegroundColor Green
}

function Copy-Profile {
    Write-Host "Copying profile..." -ForegroundColor Yellow
    Copy-Item -Path ./profile.ps1 -Destination $PROFILE -Force
    Write-Host "Profile copied successfully." -ForegroundColor Yellow
}

function Copy-Settings {
    Write-Host "Copying settings..." -ForegroundColor Cyan
    Copy-Item -Path ./settings.json -Destination "C:\Users\$($env:USERNAME)\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Force
    Write-Host "Settings copied successfully." -ForegroundColor Cyan
}

function Install-Fonts {
    Write-Host "Installing fonts..." -ForegroundColor Magenta
    .\fonts.ps1
    Write-Host "Fonts installed successfully." -ForegroundColor Magenta
}
Install-Packages
Copy-Profile
Copy-Settings
Install-Fonts