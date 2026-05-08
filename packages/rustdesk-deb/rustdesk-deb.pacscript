pkgname="rustdesk-deb"
gives="rustdesk"
repology=("project: ${gives}")
pkgver="1.4.5"
arch=('amd64' 'arm64' 'armhf')
depends=(
  "libgtk-3-0" "libxcb-randr0" "libxdo3" "libxfixes3" "libxcb-shape0" "libxcb-xfixes0"
  "libasound2" "libsystemd0" "curl" "libva-drm2" "libva-x11-2" "libvdpau1" "libxdo3"
  "libgstreamer-plugins-base1.0-0" "libpam0g" "libappindicator3-1" "gstreamer1.0-pipewire"
)
source_amd64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-x86_64.deb")
source_arm64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-aarch64.deb")
source_armhf=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-armv7-sciter.deb")
sha256sums_amd64=("6117ea2c2f5885830bff64b6b695b2596a2613dc35301539f19ae52747181c83")
sha256sums_arm64=("bb7c78043865ac16b0d843de25cc1c916bdff19a2bd1b2c34f7d46c627827682")
sha256sums_armhf=("a5c32916f313651290c62b8ecce86b5b69e1533c57e4cf84f6123ad5f3babb23")
conflicts=("${pkgname}" "${gives}")
replaces=("${conflicts[@]}")
pkgdesc="Yet another remote desktop software, written in Rust"
maintainer=(
  "xdavius <xdavius@github.com>"
  "medaey <medaey@hotmail.com>"
  "aKqir24 <aKqir24@github.com>"
)

# vim:set ft=sh ts=2 sw=2 et:
