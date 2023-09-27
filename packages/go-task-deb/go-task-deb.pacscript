name="go-task-deb"
gives="task"
pkgdesc="A task runner / simpler Make alternative written in Go"
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="3.30.1"
case "${CARCH}" in
  amd64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.deb"
    hash="22f29aba72c80ca3e974bc86da0ad46ba4e5098b4b7435cdf88b83ed603c3c48"
    ;;
  arm64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.deb"
    hash="7e6381a5d3d6aeb6fca2e2fa0f3b62baecb42e72a105181f1d67d8b0c3b93431"
    ;;
  *) return 1 ;;
esac
