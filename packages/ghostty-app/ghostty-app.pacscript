pkgname="ghostty-app"
gives="ghostty"
arch=("amd64")
pkgver="1.3.1"
url='https://github.com/psadi/ghostty-appimage'
pkgdesc="Fast, feature-rich, and cross-platform terminal emulator"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
repology=("project: ghostty")
source=("https://github.com/psadi/${gives}-appimage/releases/download/v${pkgver}/Ghostty-${pkgver}-x86_64.AppImage")
sha256sums=("fde48d2b716afd1978766879bbf1aae30dd305e8ad86a1037a2614a14d82dc28")

package() {
  chmod +x "Ghostty-${pkgver}-x86_64.AppImage"
  ./"Ghostty-${pkgver}-x86_64.AppImage" --appimage-extract &> /dev/null
  install -Dm644 "squashfs-root/share/applications/com.mitchellh.ghostty.desktop" \
    -t "${pkgdir}/usr/share/applications"
  sed -i -E \
    -e 's|^(Exec=)[^ ]+|\1env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/ghostty|g' \
    -e 's|^(TryExec=)[^ ]+|\1/usr/bin/ghostty|g' \
    -e '/^DBusActivatable=true$/d' \
    "${pkgdir}/usr/share/applications/com.mitchellh.ghostty.desktop"
  for icon_path in squashfs-root/share/icons/hicolor/*/apps/*.png; do
    install -Dm644 "${icon_path}" "${pkgdir}/usr/${icon_path#squashfs-root/}"
  done
  install -Dm755 "Ghostty-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/ghostty"
}
