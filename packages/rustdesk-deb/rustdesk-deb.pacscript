pkgname="rustdesk-deb"
gives="rustdesk"
repology=("project: ${gives}")
pkgver="1.4.4"
arch=('amd64' 'arm64' 'armhf')
depends=(
  "libgtk-3-0" "libxcb-randr0" "libxdo3" "libxfixes3" "libxcb-shape0" "libxcb-xfixes0"
  "libasound2" "libsystemd0" "curl" "libva-drm2" "libva-x11-2" "libvdpau1" "libxdo3"
  "libgstreamer-plugins-base1.0-0" "libpam0g" "libappindicator3-1" "gstreamer1.0-pipewire"
)
source_amd64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-x86_64.deb")
source_arm64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-aarch64.deb")
source_armhf=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-armv7-sciter.deb")
sha256sums_amd64=("db722ef63ee3e1e410ab34aba7b6dd3b416a61516f3b744f9b9707ee9639e46c")
sha256sums_arm64=("1a7fad258bc814b0ea03dc8d87b469301c62725e958663ff2da6e060a1d5c5b0")
sha256sums_armhf=("037d7a8387b162973228d07377fe366fd6e7388f293d1cb5f7f8f5f879644560")
conflicts=("${pkgname}" "${gives}")
replaces=("${conflicts[@]}")
pkgdesc="Yet another remote desktop software, written in Rust"
maintainer=(
  "xdavius <xdavius@github.com>"
  "medaey <medaey@hotmail.com>"
  "aKqir24 <aKqir24@github.com>"
)

# vim:set ft=sh ts=2 sw=2 et:
