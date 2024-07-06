pkgname="an-anime-game-launcher-bin"
gives="an-anime-game-launcher"
pkgver="3.10.1"
pkgdesc="Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
repology=("project: an-anime-game-launcher")
source=(
  "https://github.com/an-anime-team/an-anime-game-launcher/releases/download/${pkgver}/anime-game-launcher"
  "icon.png::https://raw.githubusercontent.com/an-anime-team/an-anime-game-launcher/main/assets/images/icon.png"
)
sha256sums=(
  "4965949c459885cb3be5bf3bd5cd0994364030c15ecfd950996afd1686269b23"
  "SKIP"
)
depends=("xdelta3")
maintainer=("Elsie19 <elsie19@pm.me>")
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")

optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
  "vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
  #"reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
)

package() {
  cd "${_archive}"
  install -Dm755 "anime-game-launcher" "${pkgdir}/usr/bin/${gives}"
  mkdir -p "${pkgdir}/usr/share/applications"
  echo '[Desktop Entry]
Name=An Anime Game Launcher
Icon=an-anime-game-launcher
Exec=an-anime-game-launcher
Type=Application
Categories=Game;
Terminal=false
X-AppImage-Version=2.4.2' | tee "${pkgdir}/usr/share/applications/an-anime-game-launcher.desktop" > /dev/null
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/an-anime-game-launcher.png"

}

post_remove() {
  if ask "Do you want to delete all launcher files(~/.local/share/anime-game-launcher)? This includes configs and the game" Y; then
    rm -rf "${homedir}/.local/share/anime-game-launcher"
  fi
}
