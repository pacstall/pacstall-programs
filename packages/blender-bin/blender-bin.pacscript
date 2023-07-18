name="blender-bin"
gives="blender"
version="3.6.1"
url="https://mirrors.ocf.berkeley.edu/blender/release/Blender${version%.*}/blender-${version}-linux-x64.tar.xz"
hash="465e1ddeb60a9a7ac5712c9bcbfe8f23a5878484e65b3d9c28795f7a70113e31"
homepage='https://www.blender.org/'
arch=("amd64")
description="A fully integrated 3D graphics creation suite"
maintainer="Elsie19 <hwengerstickel@pm.me>"
repology=("project: blender")

package() {
  cd ..
  sudo mkdir -p "${pkgdir}/opt/blender/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo cp -r "blender-${version}-linux-x64/"* "${pkgdir}/opt/blender/"
  sudo sed -i "s|Exec=blender %f|Exec=/opt/blender/blender %f|g" "${pkgdir}/opt/blender/blender.desktop"
  sudo mv "${pkgdir}/opt/blender/blender.desktop" "${pkgdir}/usr/share/applications/"
  sudo install -Dm644 "${pkgdir}/opt/blender/blender.svg" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/blender.svg"
}
