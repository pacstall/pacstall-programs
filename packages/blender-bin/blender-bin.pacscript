pkgname="blender-bin"
gives="blender"
pkgver="4.5.0"
source=("https://mirrors.ocf.berkeley.edu/blender/release/Blender${pkgver%.*}/blender-${pkgver}-linux-x64.tar.xz")
sha256sums=("1188b95cc12321c770b631939f7c25a096910b6f884a990bf9c0f62d52b38aec")
url='https://www.blender.org/'
arch=("amd64")
pkgdesc="A fully integrated 3D graphics creation suite"
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: blender")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/blender/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cp -r "blender-${pkgver}-linux-x64/"* "${pkgdir}/opt/blender/"
  sed -i "s|Exec=blender %f|Exec=/opt/blender/blender %f|g" "${pkgdir}/opt/blender/blender.desktop"
  mv "${pkgdir}/opt/blender/blender.desktop" "${pkgdir}/usr/share/applications/"
  install -Dm644 "${pkgdir}/opt/blender/blender.svg" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/blender.svg"
}
