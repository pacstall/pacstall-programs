name="go-task-deb"
gives="task"
pkgdesc="A task runner / simpler Make alternative written in Go"
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="3.33.0"
case "${CARCH}" in
  amd64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.deb"
    hash="f3c78c4e244351f6c455a3239b02e66163652770cd1428ce4d93b0137118319d"
    ;;
  arm64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.deb"
    hash="faa0f4cffa14765ba7e156d4c6daf8b536640cec5c997b8b569a2a8b04f1a216"
    ;;
  *) return 1 ;;
esac
