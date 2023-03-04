name="an-anime-game-launcher-app"
pkgname="an-anime-game-launcher"
version="2.4.5"
description="Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
repology=("project: an-anime-game-launcher")
url="https://github.com/an-anime-team/an-anime-game-launcher/releases/download/${version}/an-anime-game-launcher-${version}.AppImage"
hash="5b69461618e76f81ea16e2dd484e6ab2a1f12c8b4c26ce0332b97ad5609b8126"
maintainer="Henryws <hwengerstickel@pm.me>"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
depends="libayatana-appindicator3-1 tar unzip xdelta3 cabextract git"

optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
  "vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
  #"reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
)

install() {
  sudo chmod +x "${SRCDIR}/an-anime-game-launcher-${version}.AppImage"
  sudo install -Dm755 "an-anime-game-launcher-${version}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
  sudo mkdir -p "${pkgdir}/usr/share/applications"
  echo '[Desktop Entry]
Name=An Anime Game Launcher
Icon=an-anime-game-launcher
Exec=an-anime-game-launcher
Type=Application
Categories=Game;
Terminal=false
X-AppImage-Version=2.4.2' | sudo tee "${pkgdir}/usr/share/applications/an-anime-game-launcher.desktop" > /dev/null
  wget -q https://raw.githubusercontent.com/an-anime-team/an-anime-game-launcher/main/public/icons/64x64.png
  sudo install -Dm644 "64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/an-anime-game-launcher.png"

}

removescript() {
  if ask "Do you want to delete all launcher files(~/.local/share/anime-game-launcher)? This includes configs and the game" Y; then
    rm -rf ~/.local/share/anime-game-launcher
  fi
}
