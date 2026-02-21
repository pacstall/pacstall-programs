pkgname="wavey-launcher-bin"
gives="wavey-launcher"
arch=("amd64")
pkgver="1.0.1"
pkgdesc="Wavey Launcher for Linux with automatic patching and telemetry disabling"
repology=("project: wavey-launcher")
source=(
  "https://github.com/an-anime-team/wavey-launcher/releases/download/${pkgver}/wavey-launcher"
  "icon.png::https://raw.githubusercontent.com/an-anime-team/wavey-launcher/main/assets/images/icon.png"
)
sha256sums=(
  "ee91f347d7de593250a86b1de1aa8ed918026e1fec05655d9c44eff36fb8b439"
  "SKIP"
)
depends=("xdelta3")
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")

optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
)

package() {
  cd "${srcdir}"
  install -Dm755 "wavey-launcher" "${pkgdir}/usr/bin/${gives}"
  mkdir -p "${pkgdir}/usr/share/applications"
  echo '[Desktop Entry]
Name=Wavey Launcher
Icon=wavey-launcher
Exec=wavey-launcher
Type=Application
Categories=Game;
Terminal=false
X-AppImage-Version=2.4.2' | tee "${pkgdir}/usr/share/applications/wavey-launcher.desktop" > /dev/null
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/wavey-launcher.png"

}

post_remove() {
  if ask "Do you want to delete all launcher files(~/.local/share/wavey-launcher)? This includes configs and the game" Y; then
    rm -rf "${homedir}/.local/share/wavey-launcher"
  fi
}
