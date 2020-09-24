name="emacs"
pkgname="emacs"
version="27.1"
url="https://gnu.askapache.com/emacs/emacs-27.1.tar.xz"
license="GPL"
build_depends="build-dep"
gives="emacs"
breaks="afjdsrlkahef"
prepare() {
          cd emacs-27.1
          ./autogen.sh
          ./configure
}

build() {
        make -j$(nproc)
}

install() {
          sudo porg -lp emacs "sudo make install"
}
