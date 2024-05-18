pkgname="rpcs3-app"
gives="rpcs3"
pkgver="0.0.29-15709"
pkgsha="3c93509471f5f2f9d473a4c11682ef83366349d2"
source=("https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-${pkgsha}/rpcs3-v${pkgver}-${pkgsha:0:8}_linux64.AppImage")
url="https://rpcs3.net"
pkgdesc="PS3 emulator/debugger"
maintainer=("Thomas Crha <thomas@9bitbyte.com>")
sha256sums=("470a2998e2f8e545aa3975043983794dcd1a1f07464899b156c9cb32b2dfe2b2")

package() {
  cd "${_archive}"
  install -Dm755 "rpcs3-v${pkgver}-${pkgsha:0:8}_linux64.AppImage" "${pkgdir}/usr/bin/rpcs3"
}
# vim:set ft=sh ts=2 sw=2 et:
