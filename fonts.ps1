# Download the Hack Nerd Font
$fontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip"
$fontPath = ".\Hack.zip"
$extractPath = ".\Hack"

# Create the directory if it doesn't exist
if (!(Test-Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath
}

# Download the font
Invoke-WebRequest -Uri $fontUrl -OutFile $fontPath

# Extract the font
Expand-Archive -Path $fontPath -DestinationPath $extractPath -Force

# Install the font
$fontFiles = Get-ChildItem -Path $extractPath -Filter *.ttf
foreach ($font in $fontFiles) {
    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Win32 {
        [DllImport("gdi32.dll", EntryPoint = "AddFontResourceW")]
        public static extern int AddFontResource([In][MarshalAs(UnmanagedType.LPWStr)] string lpFileName);
        [DllImport("gdi32.dll", EntryPoint = "RemoveFontResourceW")]
        public static extern int RemoveFontResource([In][MarshalAs(UnmanagedType.LPWStr)] string lpFileName);
    }
"@
    [Win32]::AddFontResource($font.FullName)
}

# Delete the downloaded folder and zip file
Remove-Item -Path $extractPath -Recurse -Force
Remove-Item -Path $fontPath -Force

Write-Host "Hack Nerd Font installed successfully."
