pkgname="hyprlock-bin"
repology=("project: ${pkgname}")
pkgver="0.6.0"
pkgdesc="GPU-accelerated screen locking utility for Hyprland"
url='https://hyprland.org/'
source=("@${pkgname}-${pkgver}::https://github.com/hyprwm/hyprlock/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=("d09946d9132927249eb5381ad4366721c67686ba112a0d0f8948b4c1dc642240")
maintainer=("Dheeraj Reddy <dheerajre@proton.me>")
arch=('amd64' 'arm64')
depends=(
  'wayland-protocols'
  'wayland-utils'
  'libwayland-dev'
  'libpango1.0-dev'
  'libjpeg-dev'
  'libwebp-dev'
  'libmagic-dev'
  'libxkbcommon-dev'
  'libgl1-mesa-dev'
  'libcairo2-dev'
  'libdrm-dev'
  'libpam0g-dev'
)
pacdeps=(
  'hyprwayland-scanner'
  'hyprlang'
  'libhyprgraphics-bin'
  'libhyprutils-bin'
)

package() {
  cd "${pkgname}"-"${pkgver}"/
  install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
}
