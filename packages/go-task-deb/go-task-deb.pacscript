name="go-task-deb"
gives="task"
pkgdesc="A task runner / simpler Make alternative written in Go"
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="3.35.1"
case "${CARCH}" in
  amd64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.deb"
    hash="a745be92a71395b280a7a52749d18bf9bec2570765581469b3ef3aceb21dae31"
    ;;
  arm64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.deb"
    hash="97a4e9392a8ef4c427961aecd8031c772d268581b57fcd6e61a040c291e4f67f"
    ;;
  *) return 1 ;;
esac
