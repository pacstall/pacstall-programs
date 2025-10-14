pkgname="vinegar"
repology=("project: vinegar")
arch=('amd64')
pkgver="1.9.1"
url='https://vinegarhq.org/'
source=("https://github.com/vinegarhq/vinegar.git#tag=v${pkgver}")
makedepends=(
  "golang>=2:1.22"
  "pkg-config"
  "imagemagick"

  # Gio
  "gcc"
  "libwayland-dev"
  "libx11-dev"
  "libx11-xcb-dev"
  "libxkbcommon-x11-dev"
  "libgles2-mesa-dev"
  "libegl1-mesa-dev"
  "libffi-dev"
  "libxcursor-dev"
  "libvulkan-dev"
  "libglib2.0-dev-bin"
)
depends=("libgtk-4-1" "libadwaita-1-0")
optdepends=(
  "gamemode: Gamemode integration"
  "wine: A required dependency (made optional for flexibility)"
)
pkgdesc="Open-source, minimal, configurable, fast bootstrapper for running Roblox on Linux"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-3.0-only')
external_connection=true

build() {
  cd "${pkgname}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
