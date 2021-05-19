name="st-lukesmith"
pkgname="st"
version="0.16.1"
url="https://github.com/LukeSmithxyz/st.git"
license="MIT"
build_depends="make libharfbuzz-bin libxft-dev libpango1.0-dev"
depends="fontconfig"
gives="st"

prepare() {
          true
}

build() {
         true
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/st-lukesmith
}
