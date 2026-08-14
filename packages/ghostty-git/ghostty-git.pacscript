pkgname="ghostty-git"
gives="ghostty"
pkgdesc="Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration"
url='https://ghostty.org/'
maintainer="CiccioBro17 <203853964+CiccioBro17@users.noreply.github.com>"
pkgver="0.r0"
arch=("amd64" "arm64")
source=("git+https://github.com/ghostty-org/ghostty.git")
external_connection=true
pacdeps=("zig-bin" "blueprint-compiler")
makedepends=(
  "libgtk-4-dev"
  "libadwaita-1-dev"
  "gettext"
  "libxml2-utils"
  "pkg-config | pkgconf"
)

build() {
  cd "${srcdir}/ghostty"

  zig build -p ${pkgdir}/usr -Doptimize=ReleaseFast -fno-sys=gtk4-layer-shell
}
