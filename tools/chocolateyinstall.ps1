
$ErrorActionPreference = 'Stop';

$packageName= 'gitea'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.gitea.io/gitea/1.3.2/gitea-1.3.2-windows-4.0-386.exe'
$url64      = 'https://dl.gitea.io/gitea/1.3.2/gitea-1.3.2-windows-4.0-amd64.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName

  url           = $url
  url64bit      = $url64

  softwareName  = 'Gitea'

  checksum      = 'eded8b360ffd23d184c7b08b91861593d2079248240b215b092cec92fc4ebd82'
  checksumType  = 'sha256'
  checksum64    = 'bcd5b352da72deed5502020123d099480dfa76e29a33f8de9f72fb57c53dfa35'
  checksumType64= 'sha256'

  fileFullPath  = "$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
