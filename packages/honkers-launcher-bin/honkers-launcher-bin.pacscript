pkgname="honkers-launcher-bin"
gives="honkers-launcher"
pkgver="1.8.0"
pkgdesc="Launcher for a honkers game with auto-patching, discord rpc and time tracking"
repology=("project: honkers-launcher")
source=(
  "https://github.com/an-anime-team/honkers-launcher/releases/download/${pkgver}/honkers-launcher"
  "icon.png::https://raw.githubusercontent.com/an-anime-team/honkers-launcher/main/assets/images/icon.png"
)
sha256sums=(
  "a86da797c9d7381dd478d4d0d44bb616e8d2cab361290fb42d9708423a1c2e7a"
  "SKIP"
)
maintainer=("vbrabandt2005 <vbrabandt@proton.me>")
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")

optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
)

package() {
  install -Dm755 "honkers-launcher" "${pkgdir}/usr/bin/${gives}"
  mkdir -p "${pkgdir}/usr/share/applications"
  echo '[Desktop Entry]
Name=Honkers Launcher
Icon=honkers-launcher
Exec=honkers-launcher
Type=Application
Categories=Game;
Terminal=false
X-AppImage-Version=2.4.2' | tee "${pkgdir}/usr/share/applications/honkers-launcher.desktop" > /dev/null
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/honkers-launcher.png"

}

post_remove() {
  if ask "Do you want to delete all launcher files(~/.local/share/honkers-launcher)? This includes configs and the game" Y; then
    rm -rf "${homedir}/.local/share/honkers-launcher"
  fi
}
