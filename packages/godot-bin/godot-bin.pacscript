pkgname="godot-bin"
repology=("project: godot")
arch=('amd64' 'arm64')
pkgver="4.3"
url='https://godotengine.org/'
source=(
  "icon.svg"
  "org.godotengine.Godot.desktop"
  "org.godotengine.Godot.xml"
  "godot.6"
)
source_amd64=("https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v${pkgver}-stable_linux.x86_64.zip")
source_arm64=("https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v${pkgver}-stable_linux.arm64.zip")
sha256sums=(
  "1443ae974842b81765d5b50e6a729ebbf41eba2e9e515ab0919f2ea5c8b8f475"
  "a1d5b9f9c1be18abd41008115b372c49c39d41e99162186bccfefd2d610e5089"
  "16f3c4bbb80ccadde2bf4ab5681b60418aeab91ec98fc156a286af192890d891"
  "23f418e34ceeae51bc1c802645d6a56a6420e1bea0fbed503f66550539d01995"
  "7de56444b130b10af84d19c7e0cf63cf9e9937ee4ba94364c3b7dd114253ca21"
  "baaf0b753b86ef52e10c11cc7f65c0bc4696ec793ee052ea88360b31ef5462a2"
)
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
  install -Dm644 "org.godotengine.Godot.xml" "${pkgdir}/usr/share/mime/packages/org.godotengine.Godot.xml"
  install -Dm644 "godot.6" "${pkgdir}/usr/share/man/man6/godot.6"
}
