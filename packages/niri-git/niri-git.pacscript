pkgname=niri-git
pkgver="25.11"
url="https://github.com/YaLTeR/niri"
pkgdesc="Scrollable-tiling Wayland compositor"
license=("GPL-3.0-or-later")
provides=("niri")
conflicts=("niri" "niri-bin")
makedepends=("gcc" "cargo>=1.85 | rustup" "clang" "git-lfs" "libudev-dev" "libgbm-dev" "libxkbcommon-dev" "libegl1-mesa-dev" "libwayland-dev" "libinput-dev" "libdbus-1-dev" "libsystemd-dev" "libseat-dev" "libpipewire-0.3-dev" "libpango1.0-dev" "libdisplay-info-dev")
depends=("libudev1" "libgbm1" "libxkbcommon0" "libegl1" "libinput10" "libdbus-1-3" "libsystemd0" "libseat1" "libpipewire-0.3-0" "libpango1.0-dev" "libdisplay-info3 | libdisplay-info2 | libdisplay-info1")
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
arch=("amd64" "arm64")
source=("https://github.com/YaLTeR/niri.git")
external_connection=true
repology=("project: niri")

build() {
  cd "niri"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --locked --release
  for shell in bash fish zsh; do
    cargo run --locked --release --bin niri -- \
      completions "${shell}" > "${shell}-completions"
  done
}

package() {
  cd "niri"

  install -Dm755 target/release/niri -t "${pkgdir}/usr/bin/"
  install -Dm755 resources/niri-session -t "${pkgdir}/usr/bin/"
  install -Dm644 resources/niri.desktop -t "${pkgdir}/usr/share/wayland-sessions/"
  install -Dm644 resources/niri-portals.conf -t "${pkgdir}/usr/share/xdg-desktop-portal/"
  install -Dm644 resources/niri.service -t "${pkgdir}/usr/lib/systemd/user/"
  install -Dm644 resources/niri-shutdown.target -t "${pkgdir}/usr/lib/systemd/user/"
  install -Dm644 resources/default-config.kdl -t "${pkgdir}/usr/share/doc/niri"

  # shell auto-completions
  install -vDm 644 bash-completions "${pkgdir}"/usr/share/bash-completion/completions/niri
  install -vDm 644 fish-completions "${pkgdir}"/usr/share/fish/vendor_completions.d/niri.fish
  install -vDm 644 zsh-completions "${pkgdir}"/usr/share/zsh/site-functions/_niri
}
