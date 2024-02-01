name="texstudio-app"
gives="texstudio"
pkgver="4.7.2"
pkgdesc="A fully featured LaTeX editor"
homepage='https://www.texstudio.org'
arch=('amd64')
replace=("${gives}")
url="https://github.com/texstudio-org/texstudio/releases/download/${pkgver}/${gives}-${pkgver}-x86_64.AppImage"
appimage="${gives}-${pkgver}-x86_64.AppImage"
hash="443f450cfcc0435623de9d4947026f3cfec9230ed1dc693021a2ae5ef9550136"
repology=("project: ${gives}")
maintainer="vigress8 <vig@disroot.org>"

package() {
  chmod +x "${appimage}"
  ./"${appimage}" --appimage-extract "${gives}.desktop" &> /dev/null
  ./"${appimage}" --appimage-extract "${gives}.svg"     &> /dev/null

  sudo install -Dm755 "${appimage}" "${pkgdir}/usr/bin/${gives}"
  sudo install -Dm644 "squashfs-root/${gives}.desktop" -t "${pkgdir}/usr/share/applications"
  sudo install -Dm644 "squashfs-root/${gives}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
