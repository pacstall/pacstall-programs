#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="libressl"
arch=("any")
pkgver="3.7.3"
source=("@${pkgname}~${pkgver}::https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz")
pkgdesc="LibreSSL is a version of the TLS/crypto stack forked from OpenSSL in 2014, with goals of modernizing the codebase, improving security, and applying best practice development processes."
breaks=("${pkgname}-git" "${pkgname}-bin")
sha256sums=("7948c856a90c825bd7268b6f85674a8dcd254bae42e221781b24e3f8dc335db3")
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
