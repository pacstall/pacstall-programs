name=an-anime-game-launcher-gtk-bin
pkgname=an-anime-game-launcher
version=1.0.0
description="An Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
repology=("project: an-anime-game-launcher-gtk")
url="https://gitlab.com/an-anime-team/alternatives/an-anime-game-launcher-gtk/uploads/2c7f738f55161122c90f7b8f7bc40e90/anime-game-launcher"
hash="d6b8ade0adb7f43400450d943c1ef205431afb030cc9301ecd67bec0cfa8b7ea"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-bin ${pkgname}-deb ${pkgname}-app ${pkgname}-git"

depends="libayatana-appindicator3-1 tar unzip xdelta3 cabextract git libadwaita-1-0"

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
)

prepare() {
    sudo chmod +x "${SRCDIR}/an-anime-game-launcher"
}

build() {
    true
}

install() {
    # Get icon and install it
    wget -q "https://aur.archlinux.org/cgit/aur.git/plain/icon.png?h=an-anime-game-launcher-gtk-bin" -O icon.png
    sudo install -Dm644 icon.png "${STOWDIR}/${name}/usr/share/pixmaps/an-anime-game-launcher.png"

    # Get desktop file and install it
    wget -q "https://aur.archlinux.org/cgit/aur.git/plain/an-anime-game-launcher.desktop?h=an-anime-game-launcher-gtk-bin" -O an-anime-game-launcher.desktop
    sudo install -Dm644 an-anime-game-launcher.desktop -t "${STOWDIR}/${name}/usr/share/applications"

    sudo install -dm755 "${STOWDIR}/${name}/usr/lib/${pkgname}"
    sudo install -dm755 "${STOWDIR}/${name}/usr/bin/"
    sudo cp an-anime-game-launcher "${STOWDIR}/${name}/usr/lib/${pkgname}/"

    sudo ln -s -r "${STOWDIR}/${name}/usr/lib/${pkgname}/an-anime-game-launcher" "${STOWDIR}/${name}/usr/bin/an-anime-game-launcher"
}


removescript() {
  if ask "Do you want to delete all launcher files(~/.local/share/anime-game-launcher)? This includes configs and the game" Y; then
    rm -rf ~/.local/share/anime-game-launcher
  fi
}