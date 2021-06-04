name="st-lukesmith"
pkgname="st"
url="https://github.com/LukeSmithxyz/st.git"
license="MIT"
build_depends="make libharfbuzz-bin libxft-dev libpango1.0-dev"
depends="fontconfig"
gives="st"

pkgver () {
  git ls-remote https://github.com/LukeSmithxyz/st.git master | sed "s/refs\/heads\/.*//" # Returns the latest commit hash from remote
}
version="${pkgver}"
prepare() {
          true
}

build() {
         true
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/st-lukesmith
}
