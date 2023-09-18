name="krita-app"
gives="krita"
pkgver="5.1.5"
homepage="https://krita.org/"
pkgdesc="Edit and paint images"
url="https://download.kde.org/stable/${gives}/${pkgver}/${gives}-${pkgver}-x86_64.appimage"
hash="a1f7e951a8c5a43da70a56de5199fb807e44e3156973721d7d3a14974fbc225c"
__icon_url="https://github.com/AppImage/appimage.github.io/blob/master/database/Krita/icons/scalable/krita.svgz"
repology=("project: krita")
arch=("amd64")
package() {
  sudo chmod +x "${gives}-${pkgver}-x86_64.appimage"
  sudo install -Dm755 "${gives}-${pkgver}-x86_64.appimage" "${pkgdir}/usr/bin/${gives}"
  wget -q -O "krita.svgz" "${__icon_url}"
  sudo install -Dm644 "krita.svgz" "${pkgdir}/usr/share/pixmaps/krita.svgz"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
    Name=Krita
    Icon=krita
    Type=Application
    Exec=/usr/bin/krita" | sudo tee "${pkgdir}/usr/share/applications/krita.desktop" > /dev/null
}
maintainer="harrietobrien <harrietobrien@protonmail.com>"
