name="hyprcursor-bin"
pkgver="0.1.7"
pkgdesc="The hyprland cursor format, library and utilities"
arch=("amd64" "arm64")
homepage='https://github.com/hyprwm/hyprcursor'
pacdeps=("hyprlang")
url="https://github.com/hyprwm/hyprcursor/releases/download/v${pkgver}/v${pkgver}.tar.gz"
hash="b86ab68bb2260a8a09bd595ba38f0a077a08ad8a3f70c2549a59d355be6df196"
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo install -vDm755 "libhyprcursor.so.${pkgver}" -t "${pkgdir}/usr/lib/x86_64-linux-gnu/"
  sudo ln -sfv "/usr/lib/x86_64-linux-gnu/libhyprcursor.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libhyprcursor.so.0"
  sudo ln -sfv "/usr/lib/x86_64-linux-gnu/libhyprcursor.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/libhyprcursor.so"
  sudo install -vDm755 "hyprcursor.pc" -t "${pkgdir}/usr/lib/pkgconfig/"
  sudo install -vDm755 "hyprcursor-util" -t "${pkgdir}/usr/bin/"
  sudo mkdir -pv "${pkgdir}/usr/include/hyprcursor/"
  sudo cp -v include/hyprcursor/* "${pkgdir}/usr/include/hyprcursor/"
  sudo cp -v include/hyprcursor/hyprcursor.hpp "${pkgdir}/usr/include/"
}
