pkgname="zed-editor-stable-bin"
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter"
pkgver="1.29.3"
repology=("project: zed-editor")
gives="zed-editor"
license=("GPL-3.0-or-later" "AGPL-3.0-or-later" "Apache-2.0")
arch=("x86_64" "aarch64")
url='https://zed.dev'
_channel="stable"
source=("${url}/api/releases/${_channel}/${pkgver}/zed-linux-${AARCH}.tar.gz")
sha256sums_x86_64=("44b0f350aa7bf4551d1b0aaa2d3b673a6de2c03bc5e979b3592fd2180b4f77c1")
sha256sums_aarch64=("5f1de233ac02d8c9eff68e9ab4207274df3ddbd2cf9fa6f8a80ef5487f03e8ee")
maintainer=("bibelin <balian1belin@yandex.ru>" "Christian F. Brinkmann <christian.brinkmann09@gmail.com>")

# Desktop file must be named dev.zed.Zed.desktop to show correct icon in GNOME on Wayland
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

  install -Dm644 "zed.app/share/applications/${_desktop}" -t "${pkgdir}/usr/share/applications/"
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
