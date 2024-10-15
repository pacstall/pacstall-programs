pkgname="zed-editor-preview-bin"
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter (Preview release)"
pkgver="0.157.4"
repology=("project: zed-editor")
gives="zed-editor-preview"
license=("GPL-3.0-or-later" "AGPL-3.0-or-later" "Apache-2.0")
arch=("x86_64" "aarch64")
url="https://zed.dev"
_channel="preview"
source=("${url}/api/releases/${_channel}/${pkgver}/zed-linux-${AARCH}.tar.gz")
sha256sums_x86_64=("5a30d83d2997ca0494efedadd5a1711194dddf853c3b04a1e3a9fdefc2e8733e")
sha256sums_aarch64=("91e639908924aa71335e5ea484491136f2396ab871cf9cdf7150e179f9ff06d6")
maintainer=("bibelin <balian1belin@yandex.ru>")

# Desktop file should be renamed to dev.zed.Zed-Preview.desktop to show correct icon in GNOME on Wayland
# Issue: https://github.com/zed-industries/zed/issues/16694
_desktop="dev.zed.Zed-Preview.desktop"

package() {
  install -Dm755 "zed-${_channel}.app/bin/zed" -t "${pkgdir}/opt/${gives}/bin/"
  install -Dm755 "zed-${_channel}.app/libexec/zed-editor" -t "${pkgdir}/opt/${gives}/libexec"
  find "${srcdir}/zed-${_channel}.app/lib" -type "f" -exec install -Dm644 "{}" -t "${pkgdir}/opt/${gives}/lib/" \;

  local size
  for size in 512x512 1024x1024; do
    install -Dm644 "zed-${_channel}.app/share/icons/hicolor/${size}/apps/zed.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${gives}.png"
  done

  install -Dm644 "zed-${_channel}.app/share/applications/zed-${_channel}.desktop" "${pkgdir}/usr/share/applications/${_desktop}"
  # "zed" command can conflict with /usr/sbin/zed from zfs-zed package
  sed -i "s/Exec=zed/Exec=${gives}/g" "${pkgdir}/usr/share/applications/${_desktop}"
  sed -i "s/Icon=zed/Icon=${gives}/g" "${pkgdir}/usr/share/applications/${_desktop}"

  install -Dm644 "zed-${_channel}.app/licenses.md" -t "${pkgdir}/usr/share/doc/${gives}/"

  mkdir -p "${pkgdir}/usr/bin"
  # ZED_UPDATE_EXPLANATION blocks auto-updates and is used to inform the user
  # https://zed.dev/docs/development/linux#notes-for-packaging-zed
  cat > "${pkgdir}/usr/bin/${gives}" << EOL
#!/bin/sh
export ZED_UPDATE_EXPLANATION="Please use pacstall to update zed."
/opt/${gives}/bin/zed "\$@"
EOL
  chmod +x "${pkgdir}/usr/bin/${gives}"
}
