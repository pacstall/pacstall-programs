pkgname="niri"
pkgver="25.11"
arch=("amd64" "arm64")
pkgdesc="Scrollable-tiling Wayland compositor"
url='https://github.com/YaLTeR/niri'
license=('GPL-3.0-or-later')
source=("${url}.git#tag=v${pkgver}")
external_connection=true
incompatible=('debian:bullseye' 'debian:bookworm' 'debian:trixie' 'ubuntu:jammy' 'ubuntu:noble')
makedepends=("libudev-dev" "libwayland-dev" "libseat-dev" "libglib2.0-dev" "libclang-dev" "cargo>=1.80.1" "libpipewire-0.3-dev" "libcairo2-dev" "libpango1.0-dev" "libdisplay-info-dev" "libinput-dev" "libgbm-dev" "libxkbcommon-dev")
depends=("libdisplay-info3" "libseat1")
optdepends=("fuzzel: application launcher similar to rofi drun mode"
  "waybar: highly customizable Wayland bar"
  "alacritty: a cross-platform OpenGL terminal emulator"
  "mako-notifier: notification daemon for Wayland"
  "swaybg: wallpaper tool for Wayland compositors"
  "swaylock: screen locker for Wayland"
  "xdg-desktop-portal-gtk: implements most of the basic functionality"
  "xdg-desktop-portal-gnome: screencasting support"
  "gnome-keyring: implements the secret portal, for certain apps to work"
  "policykit-1-gnome: when apps need to ask for root permissions")
maintainer=("Alxhr0 <alxhr0@proton.me>")

build() {
  cd "${pkgname}"
  cargo build --locked --release --features default -j"${NCPU}"
  for shell in bash fish zsh; do
    cargo run --locked --release --bin niri -- \
      completions "${shell}" > "${shell}-completions"
  done
}

package() {
  cd "${pkgname}"

  install -vDm755 target/release/"${pkgname}" -t "${pkgdir}"/usr/bin/
  install -vDm755 resources/"${pkgname}"-session -t "${pkgdir}"/usr/bin/
  install -vDm 644 resources/"${pkgname}"{.service,-shutdown.target} -t "${pkgdir}"/usr/lib/systemd/user/
  install -vDm 644 resources/"${pkgname}".desktop -t "${pkgdir}"/usr/share/wayland-sessions/
  install -vDm 644 resources/"${pkgname}"-portals.conf -t "${pkgdir}"/usr/share/xdg-desktop-portal/
  install -vDm 644 resources/default-config.kdl README.md -t "${pkgdir}"/usr/share/doc/"${pkgname}"/

  # shell auto-completions
  install -vDm 644 bash-completions "${pkgdir}"/usr/share/bash-completion/completions/niri
  install -vDm 644 fish-completions "${pkgdir}"/usr/share/fish/vendor_completions.d/niri.fish
  install -vDm 644 zsh-completions "${pkgdir}"/usr/share/zsh/site-functions/_niri
}
