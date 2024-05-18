pkgname="st-lukesmith-git"
gives="st"
source=("https://github.com/LukeSmithxyz/st.git")
pkgver="0.0.1"
license="MIT"
makedepends=("make" "libharfbuzz-bin" "libxft-dev" "libpango1.0-dev")
depends=("fontconfig")

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
