
$ErrorActionPreference = 'Stop';

$packageName= 'gitea'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.gitea.io/gitea/1.7.4/gitea-1.7.4-windows-4.0-386.exe'
$url64      = 'https://dl.gitea.io/gitea/1.7.4/gitea-1.7.4-windows-4.0-amd64.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName

  url           = $url
  url64bit      = $url64

  softwareName  = 'Gitea'

  checksum      = '142a5a93fe706ca976dc7d476571e0986cc2cd361be87f0c72a848ffa5385492'
  checksumType  = 'sha256'
  checksum64    = '7e1211e3c63fe5e394c03a3349ae0f9f2bee1fcd0547a955bf37f16fb2542d8d'
  checksumType64= 'sha256'

  fileFullPath  = "$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
