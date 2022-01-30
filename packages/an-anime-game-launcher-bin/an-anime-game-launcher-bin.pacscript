name=an-anime-game-launcher
version=2.1.0
description="An Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://kaifa.ch/an_anime_game_launcher_210.tar.gz"
hash="b1514abeb7802be8198dfc918bb0ed88f714a4c77db26d212429daa5bb372c0e"
maintainer="Marie Piontek <marie@kaifa.ch>"

depends="libappindicator3-1 tar unzip xdelta3 cabextract git"

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "switcheroo-control: Hybrid GPU Support"
    "vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
    "reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
)

prepare() {
    chmod +x "${SRCDIR}/an_anime_game_launcher.AppImage" && "${SRCDIR}/an_anime_game_launcher.AppImage" --appimage-extract
}

build() {
    true
}

install() {
    cd "${SRCDIR}/squashfs-root"
    sudo install -dm755 "${STOWDIR}/${name}/usr/lib/${name}"
    sudo cp -dr --no-preserve=ownership resources.neu "${STOWDIR}/${name}/usr/lib/${name}"
    sudo cp -dr --no-preserve=ownership an-anime-game-launcher "${STOWDIR}/${name}/usr/lib/${name}"
    sudo cp -dr --no-preserve=ownership public "${STOWDIR}/${name}/usr/lib/${name}"

    sudo install -Dm644 "${SRCDIR}/icon.png" "${STOWDIR}/${name}/usr/share/pixmaps/${name}.png"
    sudo install -Dm755 "${SRCDIR}/an-anime-game-launcher.sh" "${STOWDIR}/${name}/usr/bin/${name}"
    sudo install -Dm644 "${SRCDIR}/an-anime-game-launcher.desktop" -t "${STOWDIR}/${name}/usr/share/applications"
}
