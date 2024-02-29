name="go-task-deb"
gives="task"
pkgdesc="A task runner / simpler Make alternative written in Go"
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="3.35.0"
case "${CARCH}" in
  amd64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.deb"
    hash="6eda7481a57bb6c021ee77184330a170b43a2e884391bdbca3126790fa38aa74"
    ;;
  arm64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.deb"
    hash="0cc6d16105c342b8c6018920bfb1c97de1756140e4336539bb24d834c8d181a8"
    ;;
  *) return 1 ;;
esac
