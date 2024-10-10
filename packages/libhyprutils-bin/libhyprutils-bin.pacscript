pkgname="libhyprutils-bin"
pkgver="0.2.3"
pkgdesc="Utilities library used across the Hyprland ecosystem"
arch=("amd64")
url='https://github.com/hyprwm/hyprutils'
source=("https://github.com/hyprwm/hyprutils/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=("326acd16f293148fb8bc8647ff350e2858362ecace2b3fae4c55d3416a85122b")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "hyprutils"
  install -vDm755 "libhyprutils.so.${pkgver}" -t "${pkgdir}/usr/lib/x86_64-linux-gnu/"
  ln -sfv "/usr/lib/x86_64-linux-gnu/libhyprutils.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libhyprutils.so.1"
  ln -sfv "/usr/lib/x86_64-linux-gnu/libhyprutils.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libhyprutils.so"
  install -vDm755 "hyprutils.pc" -t "${pkgdir}/usr/lib/pkgconfig/"
}
