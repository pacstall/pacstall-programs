name="qtile-git"
gives="qtile"
pkgver="0.23.0"
pkgdesc="A full-featured, hackable tiling window manager written and configured in Python"
breaks=("${gives}")
url="https://github.com/qtile/qtile.git"
maintainer="Ruturajn <nanotiruturaj@gmail.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
depends=(
  "libinput10"
  "libnotify4"
  "libpango-1.0-0"
  "libpangocairo-1.0-0"
  "libpulse0"
  "libwayland-client0"
  "libwayland-cursor0"
  "libwayland-server0"
  "python3.11"
  "xserver-xorg"
)
makedepends=(
  "pkg-config"
  "libiw-dev"
  "libpulse-dev"
  "libpython3.11-dev"
  "libxkbcommon-dev"
  "pipx"
)
optdepends=(
  "alsa-utils: for volume widget"
  "cmus: for cmus widget"
  "jupyter-console: for interaction with qtile via Jupyter"
  "khal: for khal_calendar widget"
  "lm-sensors: for sensors widget"
  "moc: for moc widget"
  "xorg-xwayland: for XWayland support"
)

package() {
  # Symlinking will not work correctly in this phase, but pipx needs a symlink destination, so we'll give it a stub directory.
  local PIPX_VARS=(
    "PIPX_HOME=${pkgdir}/opt"
    "PIPX_BIN_DIR=${PWD}/tmp"
    "PIPX_MAN_DIR=${PWD}/tmp"
  )
  local PIPX_FLAGS=(
    "--python python3.11"
    # "--preinstall xcffib"
    # "--quiet"
    "--system-site-packages"
    "--force"
  )
  sudo "${PIPX_VARS[@]}" pipx install "${PIPX_FLAGS[@]}" "${PWD}/[all]"
  rm -rf tmp
  sudo install -Dm644 libqtile/resources/default_config.py -t "${pkgdir}/usr/share/doc/${gives}"
  sudo install -Dm644 "resources/${gives}.desktop" -t "${pkgdir}/usr/share/xsessions"
  sudo install -Dm644 "resources/${gives}-wayland.desktop" -t "${pkgdir}/usr/share/wayland-sessions"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
}

post_install() {
  sudo ln -sf "/opt/venvs/${gives}/bin/${gives}" "/usr/bin/${gives}"
  fancy_message info "To copy the default config into your home directory, run:"
  fancy_message info "cp /usr/share/doc/${gives}/default_config.py ~/.config/${gives}/config.py"
}

post_remove() {
  sudo rm -f "/usr/bin/${gives}"
}
