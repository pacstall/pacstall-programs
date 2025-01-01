pkgname="pipes.sh-bin"
gives="pipes.sh"
arch=("all")
pkgver="1.3.0"
pkgdesc="Animated pipes terminal screensaver"
source=("@${pkgname}~${pkgver}::https://github.com/pipeseroni/${gives}/archive/v${pkgver}.tar.gz")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("532976dd8dc2d98330c45a8bcb6d7dc19e0b0e30bba8872dcce352361655a426")

package() {
  cd "${pkgname}~${pkgver}"
  # Install license
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"

  # Install doc
  install -Dm644 "README.rst" -t "${pkgdir}/usr/share/doc/${gives}"

  # Install binary
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim:set ft=sh ts=2 sw=2 et:
