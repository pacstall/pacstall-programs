name="go-task-deb"
gives="task"
pkgdesc="A task runner / simpler Make alternative written in Go"
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="3.34.0"
case "${CARCH}" in
  amd64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.deb"
    hash="00c88d7784cc9809d173706d97de9c56a826ef2034a6169a168495df5ad9b84a"
    ;;
  arm64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.deb"
    hash="3e2c93ff311096d8a8d8458a79a9a9d28b1c627914aecf9b38fbb712037b6b6d"
    ;;
  *) return 1 ;;
esac
