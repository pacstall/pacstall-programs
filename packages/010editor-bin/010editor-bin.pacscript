pkgname="010editor-bin"
pkgver="17.0"
gives="010editor"
pkgdesc="text and hex editor with templates"
arch=('x86_64')
url="https://www.sweetscape.com/010editor/"
depends=('libastyle3' 'libpng16-16t64' 'libxkbcommon0' 'libxkbcommon-x11-0')
options=('!strip')
source=('010editor.desktop')
source_x86_64=("https://download.sweetscape.com/010EditorLinux64Installer17.0.tar.gz")
sha256sums=('e3398b117934840828a96cd33534fc9b9242ec96089c2f283add137975499766')
sha256sums_x86_64=('e53aca9d53612abb5dbf88e29a4bfc740f9c6b22e916a3cffe68604451443e2b')
maintainer=("Matthias Mailänder <matthias@mailaender.name>")
repology=("project: 010editor")

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "010editor" "${pkgdir}/usr/lib/010editor"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/010editor/010editor" "${pkgdir}/usr/bin/010editor"

  install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  ln -s "/usr/lib/010editor/010_icon_128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/010editor.png"
  install -Dm0644 "010editor.desktop" "${pkgdir}/usr/share/applications/010editor.desktop"

  rm -r "${pkgdir}/usr/lib/010editor/uninstall"

  ln -sf "/usr/lib/x86_64-linux-gnu/libastyle.so.3" "${pkgdir}/usr/lib/010editor/lib/libastyle.so"
  ln -sf "/usr/lib/x86_64-linux-gnu/libxkbcommon.so.0" "${pkgdir}/usr/lib/010editor/lib/libxkbcommon.so.0"
  ln -sf "/usr/lib/x86_64-linux-gnu/libxkbcommon-x11.so.0" "${pkgdir}/usr/lib/010editor/lib/libxkbcommon-x11.so.0"
  rm "${pkgdir}/usr/lib/010editor/lib/"{libssl,libcrypto}.so.1.1
}
