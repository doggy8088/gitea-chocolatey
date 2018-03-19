
$ErrorActionPreference = 'Stop';

$packageName= 'gitea'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.gitea.io/gitea/1.3.3/gitea-1.3.3-windows-4.0-386.exe'
$url64      = 'https://dl.gitea.io/gitea/1.3.3/gitea-1.3.3-windows-4.0-amd64.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName

  url           = $url
  url64bit      = $url64

  softwareName  = 'Gitea'

  checksum      = '1dfe2aa436cdd6eedef040e1ecc71481127ac8a7d145eac36d1f274483f54eb2 '
  checksumType  = 'sha256'
  checksum64    = 'b2db74cba003e65c2521fe4e18ce01b456e79f85c09d40b92788d862cd2bd45f'
  checksumType64= 'sha256'

  fileFullPath  = "$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
