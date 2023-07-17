name="notion-git"
pkgname="notion-git"
description="The notion window manager"
maintainer="edward-riley <edward@edwardriley.co.uk>"
url="https://github.com/raboof/notion.git"
depends=("build-essential" "lua5.1" "liblua5.1-0-dev" "libx11-dev" "libxext-dev" "libsm-dev" "gettext" "libxinerama-dev" "libxrandr-dev" "libxft-dev")
gives="notion"
breaks=("notion")
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
  make -j"$(nproc)"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
