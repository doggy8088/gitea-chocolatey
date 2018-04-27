
$ErrorActionPreference = 'Stop';

$packageName= 'gitea'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.gitea.io/gitea/1.4.0/gitea-1.4.0-windows-4.0-386.exe'
$url64      = 'https://dl.gitea.io/gitea/1.4.0/gitea-1.4.0-windows-4.0-amd64.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName

  url           = $url
  url64bit      = $url64

  softwareName  = 'Gitea'

  checksum      = '115e6a176f5e59b4b9f2a716a983270dd8dc22062d966c1d9e2897eccc5b02b0'
  checksumType  = 'sha256'
  checksum64    = '4f078ff87f19c78722cb5d286f52c897b3ee0d8f5f2a61f0587bf462ef13b711'
  checksumType64= 'sha256'

  fileFullPath  = "$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
