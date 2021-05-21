#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="emacs"
pkgname="${name}"
version="27.2"
url="http://ftpmirror.gnu.org/emacs/emacs-${version}.tar.xz"
description="An extensible, customizable, free/libre text editor — and more."
build_depends="libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev libxpm-dev automake autoconf"
depends="texinfo gnutls-bin"
gives="${name}"
breaks="${name}-git ${name}-bin nano"
hash="b4a7cc4e78e63f378624e0919215b910af5bb2a0afc819fad298272e9f40c1b9"

prepare() {
  ./configure --with-gnutls=ifavailable
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR=/usr/src/pacstall/"${name}"
}
