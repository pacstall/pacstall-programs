name="fsearch-git"
gives="fsearch"
description="FSearch is a fast file search utility, inspired by Everything Search Engine. It's written in C and based on GTK3."
url="https://github.com/cboxdoerfer/${gives}.git"
build_depends="git build-essential automake autopoint autoconf libtool pkg-config intltool autoconf-archive libicu-dev libpcre3-dev libglib2.0-dev libgtk-3-dev libxml2-utils"

pkgver() {
    git ls-remote "https://github.com/cboxdoerfer/${gives}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  ./autogen.sh
}

build() {
  ./configure
  make -j$(nproc)
}

install() {
  sudo make install DESTDIR="$STOWDIR/$name"
}
