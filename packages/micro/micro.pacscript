name="micro"
gives="micro"
pkgver="2.0.11"
pkgdesc="A modern and intuitive terminal-based text editor"
maintainer="edward-riley <edward@edwardriley.co.uk>"
url="https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz"
makedepends=("build-essential")
breaks="micro"
hash="7d820c9247f7348196fef9cf151982433e5d787adc34d81ae26d8d5979b930fe"
repology=("project: ${name}")

build() {
  chmod +x "./micro"
}

package() {
  sudo install -Dm644 micro "${pkgdir}/usr/bin/micro"
  tar -czf "micro.1.tar.gz" "micro.1"
  sudo install -Dm644 micro.1.tar.gz "${pkgdir}/usr/share/man/man1/micro.1.tar.gz"
  sudo install -Dm644 "./micro.svg" "${pkgdir}/usr/share/pixmaps/micro.svg"
  sudo install -Dm644 micro.desktop "${pkgdir}/usr/share/applications/micro.desktop"
  sudo chmod +x "${pkgdir}/usr/bin/micro"
}
