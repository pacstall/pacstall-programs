pkgname="godot-bin"
repology=("project: godot")
arch=('amd64' 'arm64')
pkgver="4.3"
url='https://godotengine.org/'
source=(
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/misc/dist/linux/org.godotengine.Godot.desktop"
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/misc/dist/linux/org.godotengine.Godot.xml"
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/icon.svg"
  "https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/misc/dist/linux/godot.6"
)
source_amd64=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_linux.x86_64.zip")
source_arm64=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_linux.arm64.zip")
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
sha256sums_amd64=("7de56444b130b10af84d19c7e0cf63cf9e9937ee4ba94364c3b7dd114253ca21")
sha256sums_arm64=("baaf0b753b86ef52e10c11cc7f65c0bc4696ec793ee052ea88360b31ef5462a2")
conflicts=("godot-mono-bin" "godot-git")
gives="godot"
pkgdesc="Multi-platform 2D and 3D game engine"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('MIT')

package() {
  # Rename the binary
  for bin in Godot*; do
    mv "${bin}" godot
  done

  install -Dm755 "godot" -t "${pkgdir}/usr/bin/"
  install -Dm644 "icon.svg" "${pkgdir}/usr/share/pixmaps/${gives}.svg"
  install -Dm644 "org.godotengine.Godot.desktop" "${pkgdir}/usr/share/applications/godot.desktop"
  install -Dm644 "org.godotengine.Godot.xml" "${pkgdir}/usr/share/mime/packages/godot.xml"
  install -Dm644 "godot.6" "${pkgdir}/usr/share/man/man6/godot.6"
}
