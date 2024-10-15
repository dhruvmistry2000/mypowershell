# Welcome to the Setup Script Repository

![alt text](preview.png)

This repository contains a collection of PowerShell scripts designed to streamline the process of setting up a new Windows environment. The scripts automate the installation of essential packages, configuration of the PowerShell profile, and customization of the Windows Terminal settings.

## Scripts Overview

1. **Install-Packages**: This script checks if Winget is installed and installs it if not. It then uses Winget to install packages listed in the `packages.json` file.
2. **Copy-Profile**: This script copies the `profile.ps1` file to the user's PowerShell profile directory, allowing for customizations to the PowerShell environment.
3. **Copy-Settings**: This script copies the `settings.json` file to the Windows Terminal settings directory, customizing the terminal's appearance and behavior.
4. **Install-Fonts**: This script runs the `fonts.ps1` script, which installs custom fonts to enhance the visual experience.

## Usage

To use these scripts, simply run the `setup.ps1` file in PowerShell. This will execute all the scripts in sequence, setting up your environment with the specified configurations.

## Customization

You can customize the scripts to fit your specific needs by modifying the `packages.json`, `profile.ps1`, `settings.json`, and `fonts.ps1` files.