param (
    $source = "$($env:USERPROFILE)\OneDrive\EnvironmentSetup\ahkscripts"
)

Set-location $([Environment]::GetFolderPath("MyDocuments"));

cmd /c mklink AutoHotkey.ahk $source\AutoHotkey.ahk
cmd /c mklink /J ahkscripts $source
