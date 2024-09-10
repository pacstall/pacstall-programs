pkgname="rustdesk-deb"
gives="rustdesk"
repology=("project: ${gives}")
pkgver="1.3.0"
arch=('amd64' 'arm64' 'armhf')
depends=(
  "libgtk-3-0" "libxcb-randr0" "libxdo3" "libxfixes3" "libxcb-shape0" "libxcb-xfixes0"
  "libasound2" "libsystemd0" "curl" "libva-drm2" "libva-x11-2" "libvdpau1"
  "libgstreamer-plugins-base1.0-0" "libpam0g" "libappindicator3-1" "gstreamer1.0-pipewire"
)
source_amd64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-x86_64.deb")
source_arm64=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-aarch64.deb")
source_armhf=("https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/${gives}-${pkgver}-armv7-sciter.deb")
sha256sums_amd64=("8d77d7c708ba907e099ecffe19dc24ae907e33753e2e7472d45a11b47af9585e")
sha256sums_arm64=("03050ec5ceef88b4b76c14401167a4b813afdd53119d40eea339c838d3c356e2")
sha256sums_armhf=("e1f90cbe5536bd9abd92c943f6c6043c0af4aeef5349314b584f14ba841d8109")
conflicts=("${pkgname}" "${gives}")
replaces=("${conflicts[@]}")
pkgdesc="Yet another remote desktop software, written in Rust"
maintainer=("xdavius <xdavius@github.com>")
maintainer=("medaey <medaey@github.com>")

# vim:set ft=sh ts=2 sw=2 et:
