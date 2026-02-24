pkgname="texstudio-app"
gives="texstudio"
pkgver="4.9.2"
pkgdesc="A fully featured LaTeX editor"
url='https://www.texstudio.org'
arch=('amd64')
replaces=("${gives}")
source=("https://github.com/texstudio-org/texstudio/releases/download/${pkgver}/${gives}-${pkgver}-x86_64.AppImage")
appimage="${gives}-${pkgver}-x86_64.AppImage"
sha256sums=("56a48cf8552eec51d5dcd59ab7edc3058096e84f15597b6374abfda4046a1f70")
repology=("project: ${gives}")

package() {
  cd "${srcdir}"
  chmod +x "${appimage}"
  ./"${appimage}" --appimage-extract "${gives}.desktop" &> /dev/null
  ./"${appimage}" --appimage-extract "${gives}.svg" &> /dev/null

  install -Dm755 "${appimage}" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "squashfs-root/${gives}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "squashfs-root/${gives}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
