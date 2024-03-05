name="rhino-docker-builder-git"
gives="rhino-docker-builder"
source=("https://github.com/rhino-linux/docker.git")
pkgver="0.1.2"
pkgdesc="A script to easily build, pull, and test Rhino Linux Docker images"
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo mkdir -p "${pkgdir}/usr/local/bin"
  sudo install -Dm0755 ./"${gives}" "${pkgdir}/usr/local/bin"
}

post_install() {
  sudo ln -sf "/usr/local/bin/${gives}" "/usr/local/bin/rdb"
}

post_remove() {
  sudo rm -f "/usr/local/bin/rdb"
}
