pkgname="epic-games-launcher-app"
gives="epic-games-launcher"
pkgver="0.102.0"
_commit="g6aa6663"
pkgdesc="Official Epic Games Store launcher (Preview)"
_appimage=EpicGamesLauncher-x86_64.AppImage
source=("https://content-download-egs.distro.on.epicgames.com/Builds/EGLv2/${pkgver}%2B${_commit}/Linux/${_appimage}")
noextract=("${_appimage}")
sha256sums=("946993bc8c9c9d16e87035c964bd706272c35b5f0486498ec5b707be0db1a578")
arch=('amd64')
url='https://launcher.epicgames.com/'
license=('custom:proprietary')
maintainer=("pejuton <pejuton@proton.me>")

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract usr/share/icons/hicolor/32x32/apps/EpicGamesLauncher.png > /dev/null
  ./"${_appimage}" --appimage-extract usr/share/icons/hicolor/128x128/apps/EpicGamesLauncher.png > /dev/null
  ./"${_appimage}" --appimage-extract usr/share/icons/hicolor/256x256@2/apps/EpicGamesLauncher.png > /dev/null
  ./"${_appimage}" --appimage-extract epic-games-launcher.png > /dev/null
}

package() {
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${gives}/${_appimage}"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${gives}" << 'EOF'
#!/bin/sh
exec env APPIMAGELAUNCHER_DISABLE=1 EGL_DISABLE_SELF_UPDATE="${EGL_DISABLE_SELF_UPDATE:-1}" /opt/epic-games-launcher/EpicGamesLauncher-x86_64.AppImage "$@"
EOF
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${gives}.desktop" << EOF
[Desktop Entry]
Name=Epic Games Launcher (Preview)
Comment=Epic Games Launcher
Icon=${gives}
Exec=${gives}
Type=Application
Categories=Game;
Terminal=false
X-AppImage-Version=${pkgver}
MimeType=x-scheme-handler/com.epicgames.launcher;
EOF

  cd squashfs-root
  install -Dm644 usr/share/icons/hicolor/32x32/apps/EpicGamesLauncher.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${gives}.png"
  install -Dm644 usr/share/icons/hicolor/128x128/apps/EpicGamesLauncher.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${gives}.png"
  install -Dm644 epic-games-launcher.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${gives}.png"
  install -Dm644 usr/share/icons/hicolor/256x256@2/apps/EpicGamesLauncher.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/${gives}.png"
}
