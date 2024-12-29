pkgname="hyprcursor-bin"
pkgver="0.1.7"
pkgdesc="The hyprland cursor format, library and utilities"
arch=("amd64")
url='https://github.com/hyprwm/hyprcursor'
source=("@${pkgname}~${pkgver}::https://github.com/hyprwm/hyprcursor/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=("b86ab68bb2260a8a09bd595ba38f0a077a08ad8a3f70c2549a59d355be6df196")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${pkgname}~${pkgver}"
  install -vDm755 "libhyprcursor.so.${pkgver}" -t "${pkgdir}/usr/lib/x86_64-linux-gnu/"
  ln -sfv "/usr/lib/x86_64-linux-gnu/libhyprcursor.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libhyprcursor.so.0"
  ln -sfv "/usr/lib/x86_64-linux-gnu/libhyprcursor.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libhyprcursor.so"
  install -vDm755 "hyprcursor.pc" -t "${pkgdir}/usr/lib/pkgconfig/"
  install -vDm755 "hyprcursor-util" -t "${pkgdir}/usr/bin/"
  mkdir -pv "${pkgdir}/usr/include/hyprcursor/"
  cp -v include/hyprcursor/* "${pkgdir}/usr/include/hyprcursor/"
  cp -v include/hyprcursor/hyprcursor.hpp "${pkgdir}/usr/include/"
}
