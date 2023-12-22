name="go-task-deb"
gives="task"
pkgdesc="A task runner / simpler Make alternative written in Go"
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="3.33.1"
case "${CARCH}" in
  amd64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.deb"
    hash="420330380fe3276ad6567a06cd33b365046effceb3c72173bd887dd68edb39df"
    ;;
  arm64)
    url="https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.deb"
    hash="2385cd7015389b85d48dafd1000b4465b3d5b8f464fdf8bb9672642cb215def7"
    ;;
  *) return 1 ;;
esac
