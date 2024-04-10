name="go-task-deb"
gives="task"
pkgdesc="A task runner / simpler Make alternative written in Go"
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="3.36.0"
case "${CARCH}" in
  amd64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.deb"
    hash="8d60fc4127347b48487d7da99ffe825dd9d2d1740dcad2a9d283d30d26925753"
    ;;
  arm64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.deb"
    hash="d14fef178fa0afd02588154e179beef3972fe6d008f8bbfb86389671e63d6554"
    ;;
  *) return 1 ;;
esac
