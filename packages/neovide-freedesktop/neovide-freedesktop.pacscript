maintainer="nezred <jmnezred@pm.me>"
name="neovide-freedesktop"
gives="neovide-freedesktop"
pacdeps=("neovide-bin")
pkgver="0.12.2"
pkgdesc="App menu entries and icons for the neovide-bin package"
url="https://github.com/neovide/neovide/archive/refs/tags/${pkgver}.tar.gz"
# the neovide git package already has the desktop files, this is for the binary package
breaks=("neovide-git")
hash="5425c60454388651fd79757bde7c4d7499cdc49b375f7697b48d8366d45d08e4"
repology=("project: neovide")

package() {
  origpkg=${name%-freedesktop}
  sudo install -vDm755 "assets/${origpkg}-16x16.png" -T "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${origpkg}.png"
  sudo install -vDm755 "assets/${origpkg}-32x32.png" -T "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${origpkg}.png"
  sudo install -vDm755 "assets/${origpkg}-48x48.png" -T "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${origpkg}.png"
  sudo install -vDm755 "assets/${origpkg}-256x256.png" -T "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${origpkg}.png"
  sudo install -vDm755 "assets/${origpkg}.desktop" -t "${pkgdir}/usr/share/applications"
  sudo install -vDm755 "LICENSE" -t "${pkgdir}/usr/share/licenses/neovide"

}
