# metals-gitpod

Prebuild-friendly image for Scala SBT projects on [gitpod.io](https://gitpod.io) with help from [Metals](https://scalameta.org/metals/).

Example `.gitpod.yml`:
```yaml
image: armanbilge/metals-gitpod:0.1
tasks:
  - init: initMetals
    command: sbt
vscode:
  extensions:
    - scala-lang.scala
    - scalameta.metals
```
