name="an-anime-game-launcher-bin"
pkgname="an-anime-game-launcher"
version="2.4.0"
description="An Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
repology=("project: an-anime-game-launcher")
url="https://github.com/an-anime-team/an-anime-game-launcher/releases/download/${version}/an-anime-game-launcher-${version}.AppImage"
hash="687e46e29657955bef977ef877bffb9a26041b81891ec8a7ed35f23614e555a4"
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
    sudo chmod +x "${SRCDIR}/an-anime-game-launcher-${version}.AppImage" && "${SRCDIR}/an-anime-game-launcher-${version}.AppImage" --appimage-extract
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

    sudo install -Dm644 "64x64.png" "${STOWDIR}/${name}/usr/share/pixmaps/${pkgname}.png"
    sudo install -Dm755 "an-anime-game-launcher" "${STOWDIR}/${name}/usr/bin/${pkgname}"
    sudo install -Dm644 "an-anime-game-launcher.desktop" -t "${STOWDIR}/${name}/usr/share/applications"
}

removescript() {
  if ask "Do you want to delete all launcher files(~/.local/share/anime-game-launcher)? This includes configs and the game" Y; then
    rm -rf ~/.local/share/anime-game-launcher
  fi
}
