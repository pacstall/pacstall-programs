if [[ "$(lsb_release -si)" == "Debian" ]]; then
    fancy_message error "This script doesn't work on Debian"
    cleanup # Trigger pacstall cleanups
    exit 1
fi
name=an-anime-game-launcher-bin
pkgname=an-anime-game-launcher
version=2.2.0
description="An Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://kaifa.ch/an_anime_game_launcher_220.tar.xz"
hash="fcc5c715fb1bdd1f272d91ad61ec9f72a83218e2221f4ec06aa42226ee03899b"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"

depends="libappindicator3-1 tar unzip xdelta3 cabextract git"

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "switcheroo-control: Hybrid GPU Support"
    "vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
    "reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
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
