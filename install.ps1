Set-WinUserLanguageList en-US,th-TH -Force
Install-PackageProvider -Name NuGet -Force
# install git
#winget install --id Git.Git -e -h --accept-package-agreements --accept-source-agreements
# install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# install programs
choco install autohotkey -y
choco install docker-desktop -y
choco install git -y
choco install golang -y
choco install googlechrome -y
choco install insomnia-rest-api-client -y
choco install jetbrainstoolbox -y
choco install minikube -y
choco install nvm -y
choco install openjdk -y
choco install python -y
choco install virtualbox -y
choco install neovim -y
choco install vscode -y

# refresh
$Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# install autohotkey
#winget install -e -h Autohotkey.Autohotkey
$WebClient=New-Object Net.WebClient
$Uri='https://raw.githubusercontent.com/chubbyhippo/windows/main/CapsToChangeInputLanguage.ahk'
$WebClient.DownloadFile($Uri, "$Home\CapsToChangeInputLanguage.ahk")
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CapsToChangeInputLanguage.lnk")
$Shortcut.TargetPath = "$Home\CapsToChangeInputLanguage.ahk"
$Shortcut.Save()

git clone https://github.com/Raphire/Win11Debloat.git
Set-ExecutionPolicy Unrestricted -Scope Process -Force; .\Win11Debloat\"Win11Debloat.ps1" -Silent -RunDefaults -RemoveW11Outlook -ClearStart -ShowHiddenFolders
rm -fo -r Win11Debloat
