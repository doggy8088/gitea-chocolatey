## Gitea: Git with a cup of tea (Chocolatey package)

Project Repo: [Gitea - Git with a cup of tea](https://github.com/go-gitea/gitea)

### How to build package

```sh
choco pack
```

### How to test install locally

```sh
choco install gitea -d -s .
```

### How to test uninstall locally

```sh
choco uninstall gitea -d -s .
```

### How to publish new version

```sh
choco push gitea.X.Y.Z.nupkg --source https://push.chocolatey.org/
```

### How to update this package

1. Edit `tools/chocolateyinstall.ps1`

    * `$url`
    * `$url64`
    * `checksum`
    * `checksum64`

2. Edit `gitea.nuspec`

    * Update `<version>`
    * Update `<releaseNotes>` (reference from [here](https://raw.githubusercontent.com/go-gitea/gitea/master/CHANGELOG.md))

3. Test install

    Open Command Prompt with Administrative right

    ```sh
    choco pack
    choco install gitea -d -s . -y
    choco uninstall gitea -d -s .
    ```

4. Publish to Chocolatey Gallery

    ```sh
    choco push gitea.X.Y.Z.nupkg --source https://push.chocolatey.org/
    ```

### How to build latest version of Gitea chocolatey package

```sh
.\build.ps1
```

This will generate a `publish.ps1` file to help publish to the Chocolatey Gallery.
