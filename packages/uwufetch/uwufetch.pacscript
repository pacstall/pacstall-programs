#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="uwufetch"
arch=("any")
pkgver="2.1"
source=("@${pkgname}~${pkgver}::https://github.com/ad-oliviero/${pkgname}/archive/refs/tags/${pkgver}.zip")
pkgdesc="Meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace"
makedepends=("gcc")
optdepends=("viu: image preview"
  "lshw: hardware info")
license=("GPL-3.0")
breaks=("${pkgname}-git" "${pkgname}-bin")
sha256sums=("92b1c07529aa91df990acb5a0f5ee4c8275c10d75ba305105b17f3931a5e4a8c")

prepare() {
  cd "${pkgname}~${pkgver}"
  sed -e "s/^UWUFETCH_VERSION =.*/UWUFETCH_VERSION = ${pkgver}/" \
    -e "s/install: build/install:/" \
    -e "s/lib\$(LIB_FILES:.c=.a)$/-L. -lfetch/" \
    -i Makefile
}

build() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" -j"${NCPU}" build
}

package() {
  cd "${pkgname}~${pkgver}"
  install -dm755 "${pkgdir}/usr/include/"
  make DESTDIR="${pkgdir}/usr/" ETC_DIR="${pkgdir}/etc/" install
}

# vim:set ft=sh ts=2 sw=2 et:
