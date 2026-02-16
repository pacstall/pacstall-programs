pkgname="rhino-branding-git"
gives="rhino-branding"
source=("https://github.com/rhino-linux/branding.git")
arch=("all")
pkgver="0.0.1"
pkgdesc="Rhino branding"
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "branding"
  install -Dm644 logo.svg "${pkgdir}/usr/share/icons/desktop-base/scalable/emblems/emblem-rhino.svg"
  install -Dm644 logo.svg "${pkgdir}/usr/share/branding/rhino/logo.svg"
  install -Dm644 logo.png "${pkgdir}/usr/share/branding/rhino/logo.png"
}
