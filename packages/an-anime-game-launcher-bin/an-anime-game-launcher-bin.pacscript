name=an-anime-game-launcher-bin
pkgname=an-anime-game-launcher
version=2.0.0
description="An Launcher for a specific anime game written in Electron with auto-patching and playtime tracking function"
url="https://kaifa.ch/an_anime_game_launcher.tar.gz"
hash="63942d038a0b7a58991e1bcc7b458341de58d7a26e6016153001cbf3ad6d77a2"
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
    sudo install -dm755 "${STOWDIR}/${pkgname}/usr/lib/${pkgname}"
    sudo cp -dr --no-preserve=ownership resources.neu "${STOWDIR}/${pkgname}/usr/lib/${pkgname}"
    sudo cp -dr --no-preserve=ownership an-anime-game-launcher "${STOWDIR}/${pkgname}/usr/lib/${pkgname}"
    sudo cp -dr --no-preserve=ownership public "${STOWDIR}/${pkgname}/usr/lib/${pkgname}"

    sudo install -Dm644 "${SRCDIR}/icon.png" "${STOWDIR}/${pkgname}/usr/share/pixmaps/${pkgname}.png"
    sudo install -Dm755 "${SRCDIR}/an-anime-game-launcher.sh" "${STOWDIR}/${pkgname}/usr/bin/${pkgname}"
    sudo install -Dm644 "${SRCDIR}/an-anime-game-launcher.desktop" -t "${STOWDIR}/${pkgname}/usr/share/applications"
}
