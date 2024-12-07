pkgname="rhino-docker-builder-git"
gives="rhino-docker-builder"
source=("https://github.com/rhino-linux/docker.git")
arch=("all")
pkgver="0.1.2"
pkgdesc="A script to easily build, pull, and test Rhino Linux Docker images"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "docker"
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm0755 ./"${gives}" "${pkgdir}/usr/local/bin"
  ln -sf "/usr/local/bin/${gives}" "${pkgdir}/usr/local/bin/rdb"
}
