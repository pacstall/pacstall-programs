pkgname="pacstall-docker-builder-git"
gives="${pkgname%-git}"
source=("https://github.com/pacstall/docker.git")
arch=("all")
pkgver="0.1.3"
pkgdesc="A script to easily build, pull, and test Pacstall Docker images"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "docker"
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm0755 ./"${gives}" "${pkgdir}/usr/local/bin"
  ln -sf "/usr/local/bin/${gives}" "${pkgdir}/usr/local/bin/pdb"
}
