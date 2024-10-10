pkgname="libaquamarine-bin"
pkgver="0.4.2"
pkgdesc="Very light Linux rendering backend library"
arch=("amd64")
url='https://github.com/hyprwm/aquamarine'
source=("https://github.com/hyprwm/aquamarine/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=("1860804d49afde8bc04aacf164c4271ee8a51ae2425214bc77b8c71c66429019")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "aquamarine"
  install -vDm755 "libaquamarine.so.${pkgver}" -t "${pkgdir}/usr/lib/x86_64-linux-gnu/"
  #NOTICE: THIS CHANGES SOMETIMES, THE 3!!
  ln -sfv "/usr/lib/x86_64-linux-gnu/libaquamarine.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libaquamarine.so.3"
  ln -sfv "/usr/lib/x86_64-linux-gnu/libaquamarine.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libaquamarine.so"
  install -vDm755 "aquamarine.pc" -t "${pkgdir}/usr/lib/pkgconfig/"
  mkdir -pv "${pkgdir}/usr/include/aquamarine/"
  cp -rv include/aquamarine/* "${pkgdir}/usr/include/aquamarine/"
}
