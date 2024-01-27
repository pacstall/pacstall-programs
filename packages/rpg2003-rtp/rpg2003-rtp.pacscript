name="rpg2003-rtp"
pkgver="2003"
pkgdesc="RPG Maker 2003 Run Time Package"
homepage="https://www.rpgmakerweb.com/run-time-package"
makedepends=('unar')
url="http://dl.komodo.jp/rpgmakerweb/run-time-packages/rpg2003_rtp_installer.zip"
hash='ddd519b50a22a2a95beeb831d29f7d7d92ae6263f953491163b446b808b66863'
maintainer="vigress8 <vig@disroot.org>"
repology=("project: ${name}")

prepare() {
  unar -q rpg2003_rtp_installer.exe
}

package() {
  sudo mkdir -p "${pkgdir}/usr/share/rtp"
  sudo cp -r rpg2003_rtp_installer/. "${pkgdir}/usr/share/rtp/2003"
}
