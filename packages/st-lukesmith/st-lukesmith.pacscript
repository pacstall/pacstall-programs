name="st-lukesmith"
pkgname="st"
version="0.16.1"
url="https://github.com/LukeSmithxyz/st.git"
license="MIT"
build_depends="make"
depends="fontconfig"
gives="st"

prepare() {
          true
}

build() {
         true
}

install() {
          sudo porg -lp st-lukesmith "make install"
}
