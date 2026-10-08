pkgname="eww-git"
gives="eww"
repology=("project: ${gives}")
arch=("amd64")
pkgver="0.6.0.r53.g8661abf"
license=("MIT")
url='https://github.com/elkowar/eww'
pkgdesc='ElKowars wacky widgets'
source=("https://github.com/elkowar/eww.git")
replaces=("${gives}")
pacdeps=("rust-bin")
makedepends=(
  "libcairo2-dev"
  "libdbusmenu-gtk3-dev"
  "libgdk-pixbuf-2.0-dev"
  "libglib2.0-dev"
  "libgtk-3-dev"
  "libgtk-layer-shell-dev"
  "libpango1.0-dev"
  "git"
)
depends=(
  "libc6"
  "libcairo2"
  "libcairo-gobject2"
  "libdbusmenu-gtk3-4"
  "libgcc-s1"
  "libgdk-pixbuf-2.0-0"
  "libglib2.0-0"
  "libgtk-3-0"
  "libpango-1.0-0"
)
maintainer=("aKqir24 <aKqir24@github.com>")
optdepends=("libgtk-layer-shell0: Wayland needs this")
external_connection=true

build() {
  cd "${gives}"
  DISPLAY_SERVER="x11"
  if [[ ${XDG_SESSION_TYPE} == "wayland" ]]; then
    DISPLAY_SERVER="wayland"
  fi
  cargo build -j"${NCPU}" --release --locked --no-default-features --features "${DISPLAY_SERVER}"
}

package() {
  cd "${gives}"
  install -Dm755 "target/release/${gives}" -t "${pkgdir}/usr/bin"
}
