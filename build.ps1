$LatestJSON = ((Invoke-WebRequest "https://api.github.com/repos/go-gitea/gitea/releases/latest").Content | ConvertFrom-Json)
$LatestVersion = $LatestJSON.tag_name -replace "v" -replace ""
$ReleaseNotes  = $LatestJSON.body.Replace("`r`n`r`n", "`r`n")

$x86_sha256 = ([System.Text.Encoding]::UTF8.GetString((Invoke-WebRequest "https://dl.gitea.io/gitea/$LatestVersion/gitea-$LatestVersion-windows-4.0-386.exe.sha256").Content) -split "  ")[0]
$x64_sha256 = ([System.Text.Encoding]::UTF8.GetString((Invoke-WebRequest "https://dl.gitea.io/gitea/$LatestVersion/gitea-$LatestVersion-windows-4.0-amd64.exe.sha256").Content) -split "  ")[0]

@"
<?xml version="1.0" encoding="utf-8"?>
<package xmlns="http://schemas.microsoft.com/packaging/2015/06/nuspec.xsd">
  <metadata>
    <id>gitea</id>
    <version>$LatestVersion</version>
    <packageSourceUrl>https://github.com/doggy8088/gitea-chocolatey</packageSourceUrl>
    <owners>Will 保哥</owners>
    <title>Gitea</title>
    <authors>Gitea</authors>
    <projectUrl>https://gitea.io/</projectUrl>
    <iconUrl>https://avatars0.githubusercontent.com/u/12724356?v=4&amp;s=200</iconUrl>
    <copyright>The Gitea Authors</copyright>
    <licenseUrl>https://github.com/go-gitea/gitea/blob/master/LICENSE</licenseUrl>
    <requireLicenseAcceptance>false</requireLicenseAcceptance>
    <projectSourceUrl>https://github.com/go-gitea/gitea</projectSourceUrl>
    <docsUrl>https://docs.gitea.io/</docsUrl>
    <bugTrackerUrl>https://github.com/go-gitea/gitea/issues</bugTrackerUrl>
    <tags>gitea git</tags>
    <summary>A painless self-hosted Git service.</summary>
    <description>Gitea is a community managed fork of Gogs, lightweight code hosting solution written in Go and published under the MIT license.</description>
    <releaseNotes>$ReleaseNotes</releaseNotes>
  </metadata>
  <files>
    <file src="tools\**" target="tools" />
  </files>
</package>
"@ | Out-File -FilePath gitea.nuspec -Encoding UTF8

@"

`$ErrorActionPreference = 'Stop';

`$packageName= 'gitea'
`$toolsDir   = "`$(Split-Path -parent `$MyInvocation.MyCommand.Definition)"
`$url        = 'https://dl.gitea.io/gitea/$LatestVersion/gitea-$LatestVersion-windows-4.0-386.exe'
`$url64      = 'https://dl.gitea.io/gitea/$LatestVersion/gitea-$LatestVersion-windows-4.0-amd64.exe'
`$toolsDir   = "`$(Split-Path -parent `$MyInvocation.MyCommand.Definition)"

`$packageArgs = @{
  packageName   = `$packageName

  url           = `$url
  url64bit      = `$url64

  softwareName  = 'Gitea'

  checksum      = '$x86_sha256'
  checksumType  = 'sha256'
  checksum64    = '$x64_sha256'
  checksumType64= 'sha256'

  fileFullPath  = "`$toolsDir\gitea.exe"

  validExitCodes= @(0)
}

Get-ChocolateyWebFile @packageArgs
"@ | Out-File -FilePath tools\chocolateyinstall.ps1 -Encoding UTF8

choco pack

# choco install gitea -d -s . -y
# choco uninstall gitea -d -s .

@"
choco push gitea.$LatestVersion.nupkg --source https://push.chocolatey.org/ --key=APIKEY
"@ | Out-File -FilePath publish.ps1