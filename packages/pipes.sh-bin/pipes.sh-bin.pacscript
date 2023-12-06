name="pipes.sh-bin"
gives="pipes.sh"
pkgver="1.3.0"
pkgdesc="Animated pipes terminal screensaver"
url="https://github.com/pipeseroni/${gives}/archive/v${pkgver}.tar.gz"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
hash="532976dd8dc2d98330c45a8bcb6d7dc19e0b0e30bba8872dcce352361655a426"

package() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"

  # Install doc
  sudo install -Dm644 "README.rst" -t "${pkgdir}/usr/share/doc/${gives}"

  # Install binary
  sudo make DESTDIR="${pkgdir}" PREFIX=/usr install
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
