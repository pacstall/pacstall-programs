#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="libressl"
version="3.3.3"
pkgdir="/usr/src/pacstall/${name}"
url="https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${version}.tar.gz"
description="LibreSSL is a version of the TLS/crypto stack forked from OpenSSL in 2014, with goals of modernizing the codebase, improving security, and applying best practice development processes."
breaks="${name}-git ${name}-bin"
hash="a471565b36ccd1a70d0bd7d37c6e95c43a26a62829b487d9d2cdebfe58be3066"

prepare() {
  # Configure LibreSSL
  ./configure
}

build() {
  # Build LibreSSL
  make -j"${nproc}"
}

install() {
  # Install LibreSSL
  make install DESTDIR="${pkgdir}"
}

postinst() {
  # Configure LibreSSL linker run-time bindings
  sudo ldconfig
}
# vim:set ft=sh ts=2 sw=2 et:
