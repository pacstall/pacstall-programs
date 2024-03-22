name="rhino-docker-builder-git"
gives="rhino-docker-builder"
url="https://github.com/rhino-linux/docker.git"
pkgver="0.1.2"
pkgdesc="A script to easily build, pull, and test Rhino Linux Docker images"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo mkdir -p "${pkgdir}/usr/local/bin"
  sudo install -Dm0755 ./"${gives}" "${pkgdir}/usr/local/bin"
  sudo ln -s "/usr/local/bin/${gives}" "${pkgdir}/usr/local/bin/rdb"
}
