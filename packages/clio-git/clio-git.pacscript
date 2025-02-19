pkgname="clio-git"
gives="clio"
repology=("project: ${gives}")
pkgver="1.2.0"
pkgdesc="A command-line historian that delivers curated facts about Unix and Linux history"
arch=('all')
license=('MIT')
maintainer=("Alisha <alishyy@proton.me>")
url='https://github.com/alishyyy/clio'
source=("git+https://github.com/alishyyy/clio.git")
sha256sums=("SKIP")

package() {
  cd "${gives}"
  install -Dm755 bin/clio "${pkgdir}/usr/bin/clio"
  install -Dm644 data/facts.txt "${pkgdir}/usr/share/clio/facts.txt"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
