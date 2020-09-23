name="cmatrix"
pkgname="cmatrix"
version="2.0"
url="https://github.com/abishekvashok/cmatrix/archive/v2.0.zip"
license="GPL"
breaks=
gives="cmatrix"

prepare() {
          cd cmatrix
          ./configure
}

build() {
        make
}

install() {
          sudo porg -lp cmatrix "make install"
}
