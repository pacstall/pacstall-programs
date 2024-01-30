name="go-task-deb"
gives="task"
pkgdesc="A task runner / simpler Make alternative written in Go"
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="3.34.1"
case "${CARCH}" in
  amd64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.deb"
    hash="c40af16a9bda90ffd55c50f72d8f5ad2e7a9a341dc1edf4154e42271463858ad"
    ;;
  arm64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.deb"
    hash="02986ab73aa7428cc000a2c3c084984e1434789d01568292958769fbaaee1e19"
    ;;
  *) return 1 ;;
esac
