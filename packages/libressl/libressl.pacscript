#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="libressl"
version="3.4.3"
pkgdir="/usr/src/pacstall/${name}"
url="https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${version}.tar.gz"
description="LibreSSL is a version of the TLS/crypto stack forked from OpenSSL in 2014, with goals of modernizing the codebase, improving security, and applying best practice development processes."
breaks="${name}-git ${name}-bin"
hash="ff88bffe354818b3ccf545e3cafe454c5031c7a77217074f533271d63c37f08d"
repology=("project: libressl")

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
  sudo make install DESTDIR="${pkgdir}"
}

postinst() {
  # Configure LibreSSL linker run-time bindings
  sudo ldconfig
}
# vim:set ft=sh ts=2 sw=2 et:
