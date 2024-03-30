name="the-honkers-railway-launcher-bin"
pkgname="the-honkers-railway-launcher"
pkgver="1.5.4"
pkgdesc="Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
repology=("project: an-anime-game-launcher")
url="https://github.com/an-anime-team/the-honkers-railway-launcher/releases/download/${pkgver}/honkers-railway-launcher"
hash="c7ce99c94a629089caa1a7d22ac68dbddfb7a7e81c1e9f447b1b800f7ecf84ee"
depends=("xdelta3")
maintainer="vbrabandt2005 <https://github.com/vbrabandt2005>"
gives="${pkgname}"
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye")
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")

optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
)

package() {
  sudo install -Dm755 "honkers-railway-launcher" "${pkgdir}/usr/bin/${pkgname}"
  sudo mkdir -p "${pkgdir}/usr/share/applications"
  echo '[Desktop Entry]
Name=The Honkers Railway Launcher
Icon=the-honkers-railway-launcher
Exec=the-honkers-railway-launcher
Type=Application
Categories=Game;
Terminal=false
X-AppImage-Version=2.4.2' | sudo tee "${pkgdir}/usr/share/applications/honkers-railway-launcher.desktop" > /dev/null
  wget -q https://raw.githubusercontent.com/an-anime-team/the-honkers-railway-launcher/main/assets/images/icon.png
  sudo install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/the-honkers-railway-launcher.png"

}

post_remove() {
  if ask "Do you want to delete all launcher files(~/.local/share/the-honkers-railway-launcher)? This includes configs and the game" Y; then
    rm -rf "${homedir}/.local/share/honkers-railway-launcher"
  fi
}
