pkgname="krita-app"
gives="krita"
pkgver="5.1.5"
url="https://krita.org/"
pkgdesc="Edit and paint images"
source=(
  "https://download.kde.org/stable/${gives}/${pkgver}/${gives}-${pkgver}-x86_64.appimage"
  "https://github.com/AppImage/appimage.github.io/blob/master/database/Krita/icons/scalable/krita.svgz"
)
sha256sums=(
  "a1f7e951a8c5a43da70a56de5199fb807e44e3156973721d7d3a14974fbc225c"
  "SKIP"
)
repology=("project: krita")
arch=("amd64")
maintainer=("harrietobrien <harrietobrien@protonmail.com>")

package() {
  cd "${srcdir}"
  chmod +x "${gives}-${pkgver}-x86_64.appimage"
  install -Dm755 "${gives}-${pkgver}-x86_64.appimage" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "${srcdir}/krita.svgz" "${pkgdir}/usr/share/pixmaps/krita.svgz"
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
    Name=Krita
    Icon=krita
    Type=Application
    Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/krita %U" | tee "${pkgdir}/usr/share/applications/krita.desktop" > /dev/null
}
