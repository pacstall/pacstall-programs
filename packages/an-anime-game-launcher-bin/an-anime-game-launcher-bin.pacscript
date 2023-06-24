name="an-anime-game-launcher-bin"
pkgname="an-anime-game-launcher"
version="3.7.4"
description="Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
repology=("project: an-anime-game-launcher")
url="https://github.com/an-anime-team/an-anime-game-launcher/releases/download/${version}/anime-game-launcher"
hash="2eb66fe7c6ea68cbea766ad5d9350e3cd60ef9c0bf495f250b842ea2e646fb74"
depends=("xdelta3" "git")
maintainer="Henryws <hwengerstickel@pm.me>"
gives="${pkgname}"
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye")
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")

optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
  "vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
  #"reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
)

install() {
  sudo chmod +x "anime-game-launcher"
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
  wget -q https://raw.githubusercontent.com/an-anime-team/an-anime-game-launcher/main/assets/images/icon.png
  sudo install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/an-anime-game-launcher.png"

}

removescript() {
  if ask "Do you want to delete all launcher files(~/.local/share/anime-game-launcher)? This includes configs and the game" Y; then
    rm -rf ~/.local/share/anime-game-launcher
  fi
}
