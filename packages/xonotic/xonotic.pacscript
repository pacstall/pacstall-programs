name="xonotic"
pkgname="xonotic"
pkgver="0.8.6"
gives="xonotic"
pkgdesc="The Free and Fast Arena Shooter"
url="https://dl.unvanquished.net/share/xonotic/release/xonotic-${pkgver}.zip"
hash="50850f8d800e7499722f6ea61e478e96464a375494b5a24da93aa0598cbe964d"
breaks=("xonotic-git")
arch=('amd64')
maintainer="Herisson <spaceguybox@outlook.com>"
repology=("project: xonotic")

package() {
  sudo install -Dm755 "xonotic-linux64-sdl" "${pkgdir}/usr/bin/${pkgname}"
  sudo install -Dm755 "xonotic-linux64-glx" "${pkgdir}/usr/bin/${pkgname}-glx"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo cp ./misc/logos/xonotic.desktop ${pkgdir}/usr/share/applications/
  sudo cp ./misc/logos/xonotic-glx.desktop ${pkgdir}/usr/share/applications/
}
