pkgname="blender-bin"
gives="blender"
pkgver="5.1.2"
source=("https://mirrors.ocf.berkeley.edu/blender/release/Blender${pkgver%.*}/blender-${pkgver}-linux-x64.tar.xz")
sha256sums=("aaccb355f50183979b698bcce7467103a76261b5fa59f4972295842662a285fb")
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
