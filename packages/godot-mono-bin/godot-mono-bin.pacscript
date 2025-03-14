pkgname="godot-mono-bin"
repology=("project: godot")
arch=('amd64' 'arm64')
pkgver="4.4"
url='https://godotengine.org/'
source=(
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/${pkgver}/misc/dist/linux/org.godotengine.Godot.desktop"
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/${pkgver}/misc/dist/linux/org.godotengine.Godot.xml"
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/${pkgver}/icon.svg"
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/${pkgver}/misc/dist/linux/godot.6"
  "desktop.patch"
)
source_amd64=("@godot-mono::https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_linux_x86_64.zip")
source_arm64=("@godot-mono::https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_linux.arm64.zip")
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
sha256sums_amd64=("c54537ce6107f5996dbd58b38dbff8a8dd44016720ad4e5b58b1e5034ce54393")
sha256sums_arm64=("f0ffda9dd432b964fb71de5bcc2fe8702bcef647eec3d99e1dad8f3f8bd6ce18")
conflicts=("godot-bin" "godot-git" "godot-mono-git")
gives="godot-mono"
pkgdesc="Multi-platform 2D and 3D game engine"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('MIT')

prepare() {
  mkdir -p "${pkgdir}/opt/${gives}"
  mkdir -p "${pkgdir}/usr/bin"

  patch org.godotengine.Godot.desktop desktop.patch
}

package() {
  cd "${gives}"

  # Rename the binary
  for bin in Godot_*; do
    mv "${bin}" "${pkgdir}/opt/${gives}/${gives}"
  done

  mv GodotSharp "${pkgdir}/opt/${gives}"

  ln -sf "/opt/${gives}/${gives}" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/${gives}.svg"
  install -Dm644 "${srcdir}/org.godotengine.Godot.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
  install -Dm644 "${srcdir}/org.godotengine.Godot.xml" "${pkgdir}/usr/share/mime/packages/${gives}.xml"
  install -Dm644 "${srcdir}/godot.6" "${pkgdir}/usr/share/man/man6/${gives}.6"
}
