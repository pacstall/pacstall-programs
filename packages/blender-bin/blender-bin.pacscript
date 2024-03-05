name="blender-bin"
gives="blender"
pkgver="4.0.2"
source=("https://mirrors.ocf.berkeley.edu/blender/release/Blender${pkgver%.*}/blender-${pkgver}-linux-x64.tar.xz")
hash=("5583a5588736da8858c522ef17fff5d73be59c47a6fe91ad29c6f3263e22086a")
homepage='https://www.blender.org/'
arch=("amd64")
pkgdesc="A fully integrated 3D graphics creation suite"
maintainer="Elsie19 <elsie19@pm.me>"
repology=("project: blender")

package() {
  cd ..
  sudo mkdir -p "${pkgdir}/opt/blender/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo cp -r "blender-${pkgver}-linux-x64/"* "${pkgdir}/opt/blender/"
  sudo sed -i "s|Exec=blender %f|Exec=/opt/blender/blender %f|g" "${pkgdir}/opt/blender/blender.desktop"
  sudo mv "${pkgdir}/opt/blender/blender.desktop" "${pkgdir}/usr/share/applications/"
  sudo install -Dm644 "${pkgdir}/opt/blender/blender.svg" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/blender.svg"
}
