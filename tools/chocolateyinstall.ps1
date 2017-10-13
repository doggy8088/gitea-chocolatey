
$ErrorActionPreference = 'Stop';

$packageName= 'gitea'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.gitea.io/gitea/1.2.0/gitea-1.2.0-windows-4.0-386.exe'
$url64      = 'https://dl.gitea.io/gitea/1.2.0/gitea-1.2.0-windows-4.0-amd64.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName

  url           = $url
  url64bit      = $url64

  softwareName  = 'Gitea'

  checksum      = '3b7cc6e70d8c43a82ae20b03a93b804f270f1c190b7ae05ebdd252b9b8fe6796'
  checksumType  = 'sha256'
  checksum64    = '252eeffec28ccc591982284f6a2406cf0adc30a3820d563e21ecf68832c22879'
  checksumType64= 'sha256'

  fileFullPath  = "$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
