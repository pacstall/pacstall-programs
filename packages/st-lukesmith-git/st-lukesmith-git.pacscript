name="st-lukesmith-git"
pkgname="st"
url="https://github.com/LukeSmithxyz/st.git"
license="MIT"
build_depends="make libharfbuzz-bin libxft-dev libpango1.0-dev"
depends="fontconfig"
gives="st"
pkgver() {
  git ls-remote https://github.com/LukeSmithxyz/st.git master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

install() {
  sudo make install DESTDIR="${pkgdir}"
}
