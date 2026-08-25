pkgname="rustdesk-deb"
gives="rustdesk"
repology=("project: ${gives}")
pkgver="1.4.9"
arch=('amd64' 'arm64' 'armhf')
depends=(
  "libgtk-3-0" "libxcb-randr0" "libxdo3" "libxfixes3" "libxcb-shape0" "libxcb-xfixes0"
  "libasound2" "libsystemd0" "curl" "libva-drm2" "libva-x11-2" "libvdpau1" "libxdo3"
  "libgstreamer-plugins-base1.0-0" "libpam0g" "libappindicator3-1" "gstreamer1.0-pipewire"
)
source_amd64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-x86_64.deb")
source_arm64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-aarch64.deb")
source_armhf=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-armv7-sciter.deb")
sha256sums_amd64=("7244ba47c40e804172044bfbe659467c54ce46554c98e78c8c0406f1d612fda3")
sha256sums_arm64=("ce62c996f14d33f3bbe3a330e953644a44bace7f05885a7953f7395d69fb49c0")
sha256sums_armhf=("7c5f602f2978963fe00d75d69ec141261f27ad27920740d7c37313c402c486c8")
conflicts=("${pkgname}" "${gives}")
replaces=("${conflicts[@]}")
pkgdesc="Yet another remote desktop software, written in Rust"
maintainer=(
  "xdavius <xdavius@github.com>"
  "medaey <medaey@hotmail.com>"
)

# vim:set ft=sh ts=2 sw=2 et:
