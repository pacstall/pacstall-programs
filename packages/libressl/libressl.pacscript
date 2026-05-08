#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="libressl"
arch=("any")
pkgver="4.2.1"
source=("@${pkgname}~${pkgver}::https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz")
pkgdesc="LibreSSL is a version of the TLS/crypto stack forked from OpenSSL in 2014, with goals of modernizing the codebase, improving security, and applying best practice development processes."
breaks=("${pkgname}-git" "${pkgname}-bin")
sha256sums=("6d5c2f58583588ea791f4c8645004071d00dfa554a5bf788a006ca1eb5abd70b")
repology=("project: libressl")

prepare() {
  cd "${pkgname}~${pkgver}"
  # Configure LibreSSL
  ./configure
}

build() {
  cd "${pkgname}~${pkgver}"
  # Build LibreSSL
  make -j"${nproc}"
}

package() {
  cd "${pkgname}~${pkgver}"
  # Install LibreSSL
  make install DESTDIR="${pkgdir}"
}

post_install() {
  # Configure LibreSSL linker run-time bindings
  sudo ldconfig
}
# vim:set ft=sh ts=2 sw=2 et:
