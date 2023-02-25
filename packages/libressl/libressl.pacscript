#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="libressl"
version="3.6.1"
url="https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${version}.tar.gz"
description="LibreSSL is a version of the TLS/crypto stack forked from OpenSSL in 2014, with goals of modernizing the codebase, improving security, and applying best practice development processes."
breaks="${name}-git ${name}-bin"
hash="acfac61316e93b919c28d62d53037ca734de85c46b4d703f19fd8395cf006774"
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
