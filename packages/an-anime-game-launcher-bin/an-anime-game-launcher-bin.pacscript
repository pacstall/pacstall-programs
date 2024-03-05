name="an-anime-game-launcher-bin"
pkgname="an-anime-game-launcher"
pkgver="3.9.4"
pkgdesc="Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
repology=("project: an-anime-game-launcher")
source=(
  "https://github.com/an-anime-team/an-anime-game-launcher/releases/download/${pkgver}/anime-game-launcher"
  "https://raw.githubusercontent.com/an-anime-team/an-anime-game-launcher/main/assets/images/icon.png"
)
hash=(
  "91a1920aadee2016f9e3695b16132090eaae6c72bce4e0f6b242ea368dc01534"
  "SKIP"
)
depends=("xdelta3")
maintainer="Elsie19 <elsie19@pm.me>"
gives="${pkgname}"
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye")
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")

optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
  "vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
  #"reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
)

package() {
  sudo install -Dm755 "anime-game-launcher" "${pkgdir}/usr/bin/${pkgname}"
  sudo mkdir -p "${pkgdir}/usr/share/applications"
  echo '[Desktop Entry]
Name=An Anime Game Launcher
Icon=an-anime-game-launcher
Exec=an-anime-game-launcher
Type=Application
Categories=Game;
Terminal=false
X-AppImage-Version=2.4.2' | sudo tee "${pkgdir}/usr/share/applications/an-anime-game-launcher.desktop" > /dev/null
  sudo install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/an-anime-game-launcher.png"

}

post_remove() {
  if ask "Do you want to delete all launcher files(~/.local/share/anime-game-launcher)? This includes configs and the game" Y; then
    rm -rf "${homedir}/.local/share/anime-game-launcher"
  fi
}
