## Gitea: Git with a cup of tea (Chocolatey package)

Project Repo: [Gitea - Git with a cup of tea](https://github.com/go-gitea/gitea)

### How to build package

```
choco pack
```

### How to test install locally

```
choco install gitea -d -s .
```

### How to test uninstall locally

```
choco uninstall gitea -d -s .
```

### How to publish new version

```
choco push gitea.1.5.1.nupkg --source https://push.chocolatey.org/
```
