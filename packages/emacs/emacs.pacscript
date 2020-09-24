name="emacs"
pkgname="emacs"
version="27.1"
url="https://gnu.askapache.com/emacs/emacs-27.1.tar.xz"
license="GPL"
build_depends="build-dep"
depends="texinfo-doc-nonfree install-info info libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses5-dev libxpm-dev automake autoconf libgnutls28-dev"
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
