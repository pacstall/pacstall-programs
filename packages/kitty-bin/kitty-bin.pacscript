pkgname="kitty-bin"
gives="kitty"
pkgver="0.44.0"
arch=("amd64")
url='https://sw.kovidgoyal.net/kitty/'
pkgdesc="Fast, feature-rich GPU based terminal emulator"
source=("https://github.com/kovidgoyal/kitty/releases/download/v${pkgver}/kitty-${pkgver}-x86_64.txz")
sha256sums=("5b502801c8814c9fc5a2e8d9cfdf1c2ec5ee78b3e647f898704ad537a2ff452d")
depends=(
  "libc6"
  "libdbus-1-3"
  "libfontconfig1"
  "libx11-6"
  "libx11-xcb1"
  "libxcb-xkb1"
  "libxcursor1"
  "xkb-data"
)
recommends=("libcanberra0")
suggests=("imagemagick")
maintainer=("Tom Dryer <tomdryer.com@gmail.com>")
repology=("project: kitty-terminal")
license=("GPL-3.0-only")

package() {
  cd "${srcdir}"

  # Install `bin` and `lib` in `/opt/kitty/` because they must be side-by-side
  # in order for the binaries to find the bundled libraries via relative paths:
  install -d "${pkgdir}/opt/${gives}"
  cp -r bin lib "${pkgdir}/opt/${gives}/"

  # Symlink the binaries from `/usr/bin` so they are in PATH:
  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/${gives}/bin/"{kitty,kitten} "${pkgdir}/usr/bin/"

  # Install `share` contents to `/usr/share`:
  local paths=(
    share/applications/*
    share/icons/hicolor/*/apps/*
    share/man/man1/*
    share/man/man5/*
  )
  for path in "${paths[@]}"; do
    install -d "$(dirname "${pkgdir}/usr/${path}")"
    cp "${path}" "${pkgdir}/usr/${path}"
  done
}
