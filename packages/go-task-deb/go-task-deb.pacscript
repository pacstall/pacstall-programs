name="go-task-deb"
gives="task"
pkgdesc="A task runner / simpler Make alternative written in Go"
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="3.31.0"
case "${CARCH}" in
  amd64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.deb"
    hash="4f229adc9d62f72bf8c6bfea262aba960964aa46377f335863fb151956124fdb"
    ;;
  arm64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.deb"
    hash="52d5234f2e89d7db8cb89794a6d2bcb01ac66a970880ed154064564eeb128f23"
    ;;
  *) return 1 ;;
esac
