pkgname="rustdesk-deb"
gives="rustdesk"
repology=("project: ${gives}")
pkgver="1.3.1"
arch=('amd64' 'arm64' 'armhf')
depends=(
  "libgtk-3-0" "libxcb-randr0" "libxdo3" "libxfixes3" "libxcb-shape0" "libxcb-xfixes0"
  "libasound2" "libsystemd0" "curl" "libva-drm2" "libva-x11-2" "libvdpau1"
  "libgstreamer-plugins-base1.0-0" "libpam0g" "libappindicator3-1" "gstreamer1.0-pipewire"
)
source_amd64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-x86_64.deb")
source_arm64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-aarch64.deb")
source_armhf=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-armv7-sciter.deb")
sha256sums_amd64=("f7d675ed2160c05b2206b6b7e50a2d369b6ed7f63abe0e89b9f38f9a29793fb4")
sha256sums_arm64=("725f8d53b397add3fbab24f793baa086391d1bb1a03ff80ceacc4d96597d2e63")
sha256sums_armhf=("3ab0eb8550dc2d41c83c1e853ebf5944778a71b7acc1f73291c82010ae279d10")
conflicts=("${pkgname}" "${gives}")
replaces=("${conflicts[@]}")
pkgdesc="Yet another remote desktop software, written in Rust"
maintainer=("xdavius <xdavius@github.com>")
maintainer=("medaey <medaey@hotmail.com>")

# vim:set ft=sh ts=2 sw=2 et:
