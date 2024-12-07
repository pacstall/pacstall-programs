pkgname="notion-git"
gives="notion-git"
pkgdesc="The notion window manager"
maintainer=("edward-riley <edward@edwardriley.co.uk>")
source=("https://github.com/raboof/notion.git")
arch=("any")
pkgver="4.0.2"
depends=("build-essential" "lua5.1" "liblua5.1-0-dev" "libx11-dev" "libxext-dev" "libsm-dev" "gettext" "libxinerama-dev" "libxrandr-dev" "libxft-dev")
breaks=("notion")

build() {
  cd "notion"
  make -j"${NCPU}"
}

package() {
  cd "notion"
  make install DESTDIR="${pkgdir}"
}
