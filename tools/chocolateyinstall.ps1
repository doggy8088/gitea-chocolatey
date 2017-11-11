
$ErrorActionPreference = 'Stop';

$packageName= 'gitea'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.gitea.io/gitea/1.2.3/gitea-1.2.3-windows-4.0-386.exe'
$url64      = 'https://dl.gitea.io/gitea/1.2.3/gitea-1.2.3-windows-4.0-amd64.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName

  url           = $url
  url64bit      = $url64

  softwareName  = 'Gitea'

  checksum      = '72702070a3dc1aa93daa205c1dc86d994cf36e992f8024b0c7780bbdbe6aa8d3'
  checksumType  = 'sha256'
  checksum64    = '49490f957622319763c4b1eea78402b4ddb3c05bc384611ffc63135ae745b957'
  checksumType64= 'sha256'

  fileFullPath  = "$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
