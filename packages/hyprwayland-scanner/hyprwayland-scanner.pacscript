pkgname="hyprwayland-scanner"
pkgver="0.3.4"
pkgdesc="A Hyprland implementation of wayland-scanner, in and for C++"
arch=("amd64")
url='https://github.com/hyprwm/hyprwayland-scanner'
source=("https://github.com/hyprwm/hyprwayland-scanner/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=("ded145e7aa6aed19db53d31ac49a14a91f2b41f5475240c03afc4e20ed5851c1")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "hyprwayland-scanner"
  install -vDm755 "hyprwayland-scanner.pc" -t "${pkgdir}/usr/lib/pkgconfig/"
  install -vDm755 "hyprwayland-scanner" -t "${pkgdir}/usr/bin/"
}
