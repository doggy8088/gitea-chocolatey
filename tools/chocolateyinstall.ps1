
$ErrorActionPreference = 'Stop';

$packageName= 'gitea'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.gitea.io/gitea/1.5.1/gitea-1.5.1-windows-4.0-386.exe'
$url64      = 'https://dl.gitea.io/gitea/1.5.1/gitea-1.5.1-windows-4.0-amd64.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName

  url           = $url
  url64bit      = $url64

  softwareName  = 'Gitea'

  checksum      = '9b1cdaf16c656d68e51be6bea4862f85662b74939f0da25e126f3846d6258c93'
  checksumType  = 'sha256'
  checksum64    = 'f75f89f6e1c42a7d7c304c4195511f75ca48d2a0c69bd1c50a485ebaec171663'
  checksumType64= 'sha256'

  fileFullPath  = "$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
