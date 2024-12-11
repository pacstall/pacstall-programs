pkgname="libaquamarine-bin"
pkgver="0.5.0"
pkgdesc="Very light Linux rendering backend library"
arch=("amd64")
url='https://github.com/hyprwm/aquamarine'
source=("https://github.com/hyprwm/aquamarine/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=("4e54a7cb6df4c9f1d2f107d53f3d3f72fcb5432e411f009ba2ae84a0343ac627")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "aquamarine"
  install -vDm755 "libaquamarine.so.${pkgver}" -t "${pkgdir}/usr/lib/x86_64-linux-gnu/"
  #NOTICE: THIS CHANGES SOMETIMES, THE 4!!
  ln -sfv "/usr/lib/x86_64-linux-gnu/libaquamarine.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libaquamarine.so.4"
  ln -sfv "/usr/lib/x86_64-linux-gnu/libaquamarine.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libaquamarine.so"
  install -vDm755 "aquamarine.pc" -t "${pkgdir}/usr/lib/pkgconfig/"
  mkdir -pv "${pkgdir}/usr/include/aquamarine/"
  cp -rv include/aquamarine/* "${pkgdir}/usr/include/aquamarine/"
}
