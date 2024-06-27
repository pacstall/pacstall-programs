pkgname="rustdesk-deb"
gives="rustdesk"
repology=("project: ${gives}")
pkgver="1.2.6"
arch=('amd64' 'arm64' 'armhf')
depends=(
  "libgtk-3-0" "libxcb-randr0" "libxdo3" "libxfixes3" "libxcb-shape0" "libxcb-xfixes0"
  "libasound2" "libsystemd0" "curl" "libva-drm2" "libva-x11-2" "libvdpau1"
  "libgstreamer-plugins-base1.0-0" "libpam0g" "libappindicator3-1" "gstreamer1.0-pipewire"
)
source_amd64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-x86_64.deb")
source_arm64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-aarch64.deb")
source_armhf=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-armv7-sciter.deb")
sha256sums_amd64=("9e8d39f26d5689564d1fb0ac65119acf6a9956bee705792663d76f91451387d2")
sha256sums_arm64=("48080e34cbad332f14d6aee8f36c01d78b99f2ebcc9d74b6f1b99d4c4ef37733")
sha256sums_armhf=("c29c9a9b1b037b61d46168500c333bf9cb2c15be501aefbde5bffd7d8a9d99e3")
conflicts=("${pkgname}" "${gives}")
replaces=("${conflicts[@]}")
pkgdesc="Yet another remote desktop software, written in Rust"
maintainer=("xdavius <xdavius@github.com>")

# vim:set ft=sh ts=2 sw=2 et:
