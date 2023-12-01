name="go-task-deb"
gives="task"
pkgdesc="A task runner / simpler Make alternative written in Go"
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="3.32.0"
case "${CARCH}" in
  amd64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.deb"
    hash="fc8fb301a0409a9d017f7c006f1a3a76db73d6852059160182f4887e304c18d9"
    ;;
  arm64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.deb"
    hash="bc4302c808ab49a4551f8fc998f1d28b81af0a538ea7793469177f06cb455c8e"
    ;;
  *) return 1 ;;
esac
