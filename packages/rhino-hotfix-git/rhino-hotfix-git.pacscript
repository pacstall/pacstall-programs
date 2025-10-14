pkgname="rhino-hotfix-git"
gives="rhino-hotfix"
source=("${gives}::https://github.com/rhino-linux/hotfix.git")
arch=("all")
pkgver="0.0.1"
pkgrel="2"
depends=("jq" "curl")
compatible=("ubuntu:devel" "ubuntu:questing" "ubuntu:resolute")
pkgdesc="Fetch and run hotfixes for Rhino Linux"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${gives}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
