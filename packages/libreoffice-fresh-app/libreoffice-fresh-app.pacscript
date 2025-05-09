pkgname="libreoffice-fresh-app"
repology=("project: libreoffice")
arch=("amd64")
pkgver="24.8.4.2"
url='https://www.libreoffice.org/'
source=(
  "https://appimages.libreitalia.org/LibreOffice-${pkgver}.full-x86_64.AppImage"
  "libreoffice-app"
  "startcenter.desktop"
  "base.desktop"
  "writer.desktop"
  "impress.desktop"
  "calc.desktop"
  "math.desktop"
)
sha256sums=(
  "323830d8efdca5402f5743e0c025c21b90bba456873c5d592ba988ab162127fe"
  "1bce83a3b51c1aa00957f4ecd96cc6c4e5cf2f2e2c73aa4904099a7f6676605f"
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
depends=("default-jre")
gives="libreoffice"
pkgdesc="a private, free and open source office suite"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('MPL-2.0')

prepare() {
  mkdir -p "${pkgdir}/usr/share/applications"
}

package() {
  install -Dm755 "LibreOffice-${pkgver}.full-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/libreoffice.AppImage"
  install -Dm755 -t "${pkgdir}/usr/bin" libreoffice-app

  for desktopfile in *.desktop; do
    install -Dm644 "${desktopfile}" "${pkgdir}/usr/share/applications/libreoffice-${desktopfile}"
  done
}
