pkgname="zed-editor-stable-bin"
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter"
pkgver="1.18.1"
repology=("project: zed-editor")
gives="zed-editor"
license=("GPL-3.0-or-later" "AGPL-3.0-or-later" "Apache-2.0")
arch=("x86_64" "aarch64")
url='https://zed.dev'
_channel="stable"
source=("${url}/api/releases/${_channel}/${pkgver}/zed-linux-${AARCH}.tar.gz")
sha256sums_x86_64=("eea62268d8ec5fd3587df06fa76e072c104cca5e0b0b0abecbc28ae5b87c0bad")
sha256sums_aarch64=("7ee93bcd1059c4f0d700578ccfa00aebda5fc521c943fe3ffbf71aac41a081a7")
maintainer=("bibelin <balian1belin@yandex.ru>" "Christian F. Brinkmann <christian.brinkmann09@gmail.com>")

# Desktop file should be renamed to dev.zed.Zed.desktop to show correct icon in GNOME on Wayland
# Issue: https://github.com/zed-industries/zed/issues/16694
_desktop="dev.zed.Zed.desktop"

package() {
  install -Dm755 "zed.app/bin/zed" -t "${pkgdir}/opt/${gives}/bin/"
  install -Dm755 "zed.app/libexec/zed-editor" -t "${pkgdir}/opt/${gives}/libexec"
  find "${srcdir}/zed.app/lib" -type "f" -exec install -Dm644 "{}" -t "${pkgdir}/opt/${gives}/lib/" \;

  local size
  for size in 512x512 1024x1024; do
    install -Dm644 "zed.app/share/icons/hicolor/${size}/apps/zed.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${gives}.png"
  done

  install -Dm644 "zed.app/share/applications/zed.desktop" "${pkgdir}/usr/share/applications/${_desktop}"
  # "zed" command can conflict with /usr/sbin/zed from zfs-zed package
  sed -i "s/Exec=zed/Exec=${gives}/g" "${pkgdir}/usr/share/applications/${_desktop}"
  sed -i "s/Icon=zed/Icon=${gives}/g" "${pkgdir}/usr/share/applications/${_desktop}"

  install -Dm644 "zed.app/licenses.md" -t "${pkgdir}/usr/share/doc/${gives}/"

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
