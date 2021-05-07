name="emacs"
pkgname="emacs"
version="27.2"
url="http://ftpmirror.gnu.org/emacs/emacs-27.2.tar.xz"
description="An extensible, customizable, free/libre text editor — and more."
gives="emacs"
breaks="emacs-git emacs-bin nano"
hash="b4a7cc4e78e63f378624e0919215b910af5bb2a0afc819fad298272e9f40c1b9"
maintainer="wizard-28 <basak.sb2006@gmail.com>"

prepare() {
  ./configure --with-gnutls=ifavailable
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR=/usr/src/pacstall/emacs
}
