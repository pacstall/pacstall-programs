name="st-lukesmith-git"
gives="st"
url="https://github.com/LukeSmithxyz/st.git"
pkgver="0.0.1"
license="MIT"
makedepends=("make" "libharfbuzz-bin" "libxft-dev" "libpango1.0-dev")
depends=("fontconfig")
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
