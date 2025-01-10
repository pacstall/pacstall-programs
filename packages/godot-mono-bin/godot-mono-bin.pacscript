pkgname="godot-mono-bin"
repology=("project: godot")
arch=('amd64' 'arm64')
pkgver="4.3"
url='https://godotengine.org/'
source=(
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/misc/dist/linux/org.godotengine.Godot.desktop"
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/misc/dist/linux/org.godotengine.Godot.xml"
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/icon.svg"
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/misc/dist/linux/godot.6"
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
sha256sums_amd64=("ecdf3cd5a6004a6568c199581d58ba685a9905926e51677906b76fbdd9cad351")
sha256sums_arm64=("1ae242eb7dc30c281efef3f8a518580c9c997eb494a0b978d9504206a3f890c4")
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
