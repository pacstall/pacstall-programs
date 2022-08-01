name=an-anime-game-launcher-bin
pkgname=an-anime-game-launcher
version=2.3.7
description="An Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
repology=("project: an-anime-game-launcher")
url="https://aagl.launcher.moe/dl/an_anime_game_launcher_${version//./}.tar.xz"
hash="ff69f3fdb620d944c787cb1379b35df0ef266b9b4171cf6f236a9af292c602ba"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"

depends="libayatana-appindicator3-1 tar unzip xdelta3 cabextract git"

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
    #"reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
)

prepare() {
    sudo chmod +x "${SRCDIR}/an_anime_game_launcher.AppImage" && "${SRCDIR}/an_anime_game_launcher.AppImage" --appimage-extract
}

build() {
    true
}

install() {
    cd "${SRCDIR}/squashfs-root"
    sudo install -dm755 "${STOWDIR}/${name}/usr/lib/${pkgname}"
    sudo cp -dr --no-preserve=ownership resources.neu "${STOWDIR}/${name}/usr/lib/${pkgname}"
    sudo cp -dr --no-preserve=ownership an-anime-game-launcher "${STOWDIR}/${name}/usr/lib/${pkgname}"
    sudo cp -dr --no-preserve=ownership public "${STOWDIR}/${name}/usr/lib/${pkgname}"

    sudo install -Dm644 "${SRCDIR}/icon.png" "${STOWDIR}/${name}/usr/share/pixmaps/${pkgname}.png"
    sudo install -Dm755 "${SRCDIR}/an-anime-game-launcher.sh" "${STOWDIR}/${name}/usr/bin/${pkgname}"
    sudo install -Dm644 "${SRCDIR}/an-anime-game-launcher.desktop" -t "${STOWDIR}/${name}/usr/share/applications"
}

removescript() {
  if ask "Do you want to delete all launcher files(~/.local/share/anime-game-launcher)? This includes configs and the game" Y; then
    rm -rf ~/.local/share/anime-game-launcher
  fi
}
