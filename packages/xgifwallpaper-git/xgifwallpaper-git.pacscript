pkgname="xgifwallpaper-git"
gives="xgifwallpaper"
pkgver="0.3.2"
pkgdesc="Use an animated GIF as wallpaper on X11 systems"
arch=("amd64" "arm64")
url='https://github.com/calculon102/xgifwallpaper'
license=("GPL-3.0-only")
depends=(
  "libc6"
  "libxau6"
  "libxcb1"
  "libxdmcp6"
)
makedepends=(
  "gcc"
  "git"
  "cargo"
  "rustc"
  "libx11-dev"
  "libxinerama-dev"
  "libxext-dev"
)
source=("${url}.git")
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

build() {
  cd "${gives}"
  cargo build --release --locked --all-features -j"${NCPU}"
}

package() {
  cd "${gives}"
  install -Dm755 "target/release/${gives}" -t "${pkgdir}/usr/bin"
}
