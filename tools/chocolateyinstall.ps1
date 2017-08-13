
$ErrorActionPreference = 'Stop';

$packageName= 'gitea'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.gitea.io/gitea/1.1.3/gitea-1.1.3-windows-4.0-386.exe'
$url64      = 'https://dl.gitea.io/gitea/1.1.3/gitea-1.1.3-windows-4.0-amd64.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName

  url           = $url
  url64bit      = $url64

  softwareName  = 'Gitea'

  checksum      = '6e702a7d7586cda44c098641c76c38b599e250d8979b179dc65748e6211202be'
  checksumType  = 'sha256'
  checksum64    = '33f7f7093b0a1c7e009cf348b7023e80424ebf75a7b08b25216f50d570501f27'
  checksumType64= 'sha256'

  fileFullPath  = "$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
