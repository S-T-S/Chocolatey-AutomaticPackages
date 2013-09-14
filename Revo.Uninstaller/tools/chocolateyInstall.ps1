$package = '{{PackageName}}';

try {
    $scriptDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition);
    $installerAuto = Join-Path $scriptDir 'Revo.Uninstaller.au3';

    $installerPackage = Join-Path $scriptDir "revosetup.exe";
    Get-ChocolateyWebFile $package $installerPackage '{{DownloadUrl}}';
  
    Write-Host "Installing `'$installerPackage`' with AutoIt3 using `'$installerAuto`'"
    $installArgs = "/c autoit3 `"$installerAuto`" `"$installerPackage`""
    Start-ChocolateyProcessAsAdmin "$installArgs" "cmd.exe"

    Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw 
}
