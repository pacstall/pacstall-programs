name="rpg2000-rtp"
pkgver="2000"
pkgdesc="RPG Maker 2000 Run Time Package"
homepage="https://www.rpgmakerweb.com/run-time-package"
makedepends=('unar')
url="http://dl.komodo.jp/rpgmakerweb/run-time-packages/rpg2000_rtp_installer.exe"
hash='ec82b92da65ca6fdb2d3df25dfbcd7f2bb716e4fe63a079e8e5e396e91fa5e29'

prepare() {
  unar -q rpg2000_rtp_installer.exe
}

package() {
  mkdir -p "${pkgdir}/usr/share/rtp"
  cp -rf rpg2000_rtp_installer/. "${pkgdir}/usr/share/rtp/2000"
}
