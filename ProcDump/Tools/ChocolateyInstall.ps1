$packageName = '{{PackageName}}'
#$url = 'http://download.sysinternals.com/files/Procdump.zip'
$url = '{{DownloadUrl}}'
$drop = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage $packageName $url $drop