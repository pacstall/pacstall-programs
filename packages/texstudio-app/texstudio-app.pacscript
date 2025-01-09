pkgname="texstudio-app"
gives="texstudio"
pkgver="4.8.3"
pkgdesc="A fully featured LaTeX editor"
url='https://www.texstudio.org'
arch=('amd64')
replaces=("${gives}")
source=("https://github.com/texstudio-org/texstudio/releases/download/${pkgver}/${gives}-${pkgver}-x86_64.AppImage")
appimage="${gives}-${pkgver}-x86_64.AppImage"
sha256sums=("737c968412cd9bae9e63dc3cd0f2025fa111c4e52c07fc3515d15b569101a6f8")
repology=("project: ${gives}")
maintainer=()

package() {
  cd "${srcdir}"
  chmod +x "${appimage}"
  ./"${appimage}" --appimage-extract "${gives}.desktop" &> /dev/null
  ./"${appimage}" --appimage-extract "${gives}.svg" &> /dev/null

  install -Dm755 "${appimage}" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "squashfs-root/${gives}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "squashfs-root/${gives}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
