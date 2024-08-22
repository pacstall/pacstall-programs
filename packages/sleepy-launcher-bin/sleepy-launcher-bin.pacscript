pkgname="sleepy-launcher-bin"
gives="sleepy-launcher"
pkgver="1.1.0"
pkgdesc="Sleepy game launcher for Linux with telemetry disabling"
repology=("project: sleepy-launcher")
source=(
  "https://github.com/an-anime-team/sleepy-launcher/releases/download/${pkgver}/sleepy-launcher"
  "icon.png::https://raw.githubusercontent.com/an-anime-team/sleepy-launcher/main/assets/images/icon.png"
)
sha256sums=(
  "d546af15170c13d206d25b338f7463943a9bd68c5afd31aa5522b1f3e0198d30"
  "SKIP"
)
depends=("xdelta3" "p7zip-full" "webp")
maintainer=("vbrabandt2005 <vbrabandt@proton.me>")
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")

optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
)

package() {
  install -Dm755 "sleepy-launcher" "${pkgdir}/usr/bin/${gives}"
  mkdir -p "${pkgdir}/usr/share/applications"
  echo '[Desktop Entry]
Name=Sleepy Launcher
Icon=sleepy-launcher
Exec=sleepy-launcher
Type=Application
Categories=Game;
Terminal=false
X-AppImage-Version=2.4.2' | tee "${pkgdir}/usr/share/applications/sleepy-launcher.desktop" > /dev/null
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/sleepy-launcher.png"

}

post_remove() {
  if ask "Do you want to delete all launcher files(~/.local/share/sleepy-launcher)? This includes configs and the game" Y; then
    rm -rf "${homedir}/.local/share/sleepy-launcher"
  fi
}
