pkgname="the-honkers-railway-launcher-bin"
gives="the-honkers-railway-launcher"
pkgver="1.7.0"
pkgdesc="The Honkers Railway launcher for Linux with automatic patching and telemetry disabling"
repology=("project: the-honkers-railway-launcher")
source=(
  "https://github.com/an-anime-team/the-honkers-railway-launcher/releases/download/${pkgver}/honkers-railway-launcher"
  "icon.png::https://raw.githubusercontent.com/an-anime-team/the-honkers-railway-launcher/main/assets/images/icon.png"
)
sha256sums=(
  "f6be9f0825666b871a1616c9a6c6fd677f9323191bdcfa0f8f47c234c6a1f681"
  "SKIP"
)
maintainer=("vbrabandt2005 <vbrabandt@proton.me>")
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")

optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
)

package() {
  install -Dm755 "honkers-railway-launcher" "${pkgdir}/usr/bin/${gives}"
  mkdir -p "${pkgdir}/usr/share/applications"
  echo '[Desktop Entry]
Name=The Honkers Railway Launcher
Icon=the-honkers-railway-launcher
Exec=the-honkers-railway-launcher
Type=Application
Categories=Game;
Terminal=false
X-AppImage-Version=2.4.2' | tee "${pkgdir}/usr/share/applications/honkers-railway-launcher.desktop" > /dev/null
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/the-honkers-railway-launcher.png"

}

post_remove() {
  if ask "Do you want to delete all launcher files(~/.local/share/the-honkers-railway-launcher)? This includes configs and the game" Y; then
    rm -rf "${homedir}/.local/share/honkers-railway-launcher"
  fi
}
