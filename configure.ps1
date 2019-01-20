# Install useful ASDK Host Apps via Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# Enable Choco Global Confirmation

choco feature enable -n allowGlobalConfirmation
# Add Choco to default path
$testEnvPath = $Env:path
if (!($testEnvPath -contains "$env:ProgramData\chocolatey\bin")) {
    $Env:path = $env:path + ";$env:ProgramData\chocolatey\bin"
}
# Visual Studio Code
choco install vscode
# Putty
choco install putty.install
# WinSCP
choco install winscp.install
# Chrome
choco install googlechrome
# WinDirStat
choco install windirstat
# Python
choco install python3 --params "/InstallDir:C:\Python"
refreshenv
# Set Environment Variables
[System.Environment]::SetEnvironmentVariable("PATH", "$env:Path;C:\Python;C:\Python\Scripts", "Machine")
[System.Environment]::SetEnvironmentVariable("PATH", "$env:Path;C:\Python;C:\Python\Scripts", "User")
# Set Current Session Variable
$testEnvPath = $Env:path
if (!($testEnvPath -contains "C:\Python;C:\Python\Scripts")) {
    $Env:path = $env:path + ";C:\Python;C:\Python\Scripts"
}

python -m ensurepip --default-pip
python -m pip install -U pip
refreshenv

pip install certifi
refreshenv
# Azure CLI
Write-CustomVerbose -Message "Installing latest version of Azure CLI with Chocolatey"
choco install azure-cli
refreshenv