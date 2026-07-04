pkgname="rustdesk-deb"
gives="rustdesk"
repology=("project: ${gives}")
pkgver="1.4.8"
arch=('amd64' 'arm64' 'armhf')
depends=(
  "libgtk-3-0" "libxcb-randr0" "libxdo3" "libxfixes3" "libxcb-shape0" "libxcb-xfixes0"
  "libasound2" "libsystemd0" "curl" "libva-drm2" "libva-x11-2" "libvdpau1" "libxdo3"
  "libgstreamer-plugins-base1.0-0" "libpam0g" "libappindicator3-1" "gstreamer1.0-pipewire"
)
source_amd64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-x86_64.deb")
source_arm64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-aarch64.deb")
source_armhf=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-armv7-sciter.deb")
sha256sums_amd64=("c426f0a50ce141be3babf653ee920f43c30cf5159deb7d46b0a58ee07d5f547e")
sha256sums_arm64=("0663487c2e5c976b686038cf295154ac9de7709628729dbb45a01f8e0da431d7")
sha256sums_armhf=("cfcf39c92d34546c3d1b870cff8e2a7a695d9efb367f0dc8d95cf5473662b7f4")
conflicts=("${pkgname}" "${gives}")
replaces=("${conflicts[@]}")
pkgdesc="Yet another remote desktop software, written in Rust"
maintainer=(
  "xdavius <xdavius@github.com>"
  "medaey <medaey@hotmail.com>"
  "aKqir24 <aKqir24@github.com>"
)

# vim:set ft=sh ts=2 sw=2 et:
