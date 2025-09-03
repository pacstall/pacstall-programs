pkgname="p3x-onenote-app"
_name="P3X-OneNote"
gives="p3x-onenote"
pkgver="2025.4.124"
url='https://www.corifeus.com/onenote'
pkgdesc="Independent browser window for OneNote online"
depends=(
  "perl-base"
  "liblocale-gettext-perl"
)
incompatible=('debian:sid')
source=(
  "${_name}-${pkgver}.AppImage::https://github.com/patrikx3/onenote/releases/download/v${pkgver}/${_name}-${pkgver}.AppImage"
  "p3x-onenote.desktop"
  "onenote.svg"
)
sha256sums="0360c6a0c8fc113dad5cdfaeaa3c30330087ed999ea9954f2b1dc21dd725df82"
arch=("amd64")
maintainer=("harrietobrien <harrietobrien@protonmail.com>")

package() {
  install -Dm755 "${_name}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "onenote.svg" "${pkgdir}/usr/share/pixmaps/onenote.svg"
  mkdir -p "${pkgdir}/usr/share/applications/"
  install -Dm644 -t "${pkgdir}/usr/share/applications" p3x-onenote.desktop
}
