function Install-Packages {
    $response = Read-Host "Do you want to install packages? (yes/no)"
    if ($response -eq "yes") {
        Write-Host "Checking if winget is installed..." -ForegroundColor Green
        if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
            Write-Host "Winget is not installed. Installing it now..." -ForegroundColor Green
            Start-Process powershell "Invoke-WebRequest -Uri https://aka.ms/installwinget -UseBasicParsing" -Wait
        }
        Write-Host "Winget is installed. Installing packages..." -ForegroundColor Green
        Start-Process winget -ArgumentList "import -i .\packages.json" -Wait
        Write-Host "Packages installed successfully." -ForegroundColor Green
    } else {
        Write-Host "Package installation cancelled." -ForegroundColor Green
    }
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
Install-Packages
Copy-Profile
Copy-Settings
