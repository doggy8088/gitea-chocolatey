
$ErrorActionPreference = 'Stop';

$packageName= 'gitea'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.gitea.io/gitea/1.7.0/gitea-1.7.0-windows-4.0-386.exe'
$url64      = 'https://dl.gitea.io/gitea/1.7.0/gitea-1.7.0-windows-4.0-amd64.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName

  url           = $url
  url64bit      = $url64

  softwareName  = 'Gitea'

  checksum      = '66c920fa737c76f2c02ad70df300a6d69d1230221fd3ab118766fdba6bb233f1'
  checksumType  = 'sha256'
  checksum64    = '86a76dbd237e03aff314e975d776fb4d57dc20c64bff1d69f8a1e476e27a0801'
  checksumType64= 'sha256'

  fileFullPath  = "$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
