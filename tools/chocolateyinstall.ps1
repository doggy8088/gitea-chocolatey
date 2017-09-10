
$ErrorActionPreference = 'Stop';

$packageName= 'gitea'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.gitea.io/gitea/1.1.4/gitea-1.1.4-windows-4.0-386.exe'
$url64      = 'https://dl.gitea.io/gitea/1.1.4/gitea-1.1.4-windows-4.0-amd64.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName

  url           = $url
  url64bit      = $url64

  softwareName  = 'Gitea'

  checksum      = '631f7b4a2a13ba1a5a57d4c420e3be1c85fe74a44661bc20305bfc91793e68e4'
  checksumType  = 'sha256'
  checksum64    = '0fb04e06e984ca9150ce47242e281c579b1ee28fefeaf1b7131b18829595f239'
  checksumType64= 'sha256'

  fileFullPath  = "$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
