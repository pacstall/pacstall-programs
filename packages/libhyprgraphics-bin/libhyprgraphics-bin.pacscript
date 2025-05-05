pkgname="libhyprgraphics-bin"
pkgver="0.1.1"
pkgdesc="Small C++ library with graphics / resource related utilities used across the hypr* ecosystem"
arch=("amd64")
url='https://github.com/hyprwm/hyprgraphics'
source=("https://github.com/hyprwm/hyprgraphics/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=("cebbbb1f0afc7cda96e59c7d55c12798c2dff960f5948aa06805ab08f243a6a8")
maintainer=("Dheeraj Reddy <dheerajre@proton.me>")

package() {
  cd "hyprgraphics"
  install -vDm755 "libhyprgraphics.so.${pkgver}" -t "${pkgdir}/usr/lib/x86_64-linux-gnu/"
  ln -sfv "/usr/lib/x86_64-linux-gnu/libhyprgraphics.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libhyprgraphics.so.1"
  ln -sfv "/usr/lib/x86_64-linux-gnu/libhyprgraphics.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libhyprgraphics.so"
  install -vDm755 "hyprgraphics.pc" -t "${pkgdir}/usr/lib/pkgconfig/"
}
