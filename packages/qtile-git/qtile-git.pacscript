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
  "libnotify4"
  "libpangocairo-1.0-0"
  "libpulse0"
  "python3.11"
  "xserver-xorg"
)
makedepends=(
  "pkg-config"
  "libiw-dev"
  "libpulse-dev"
  "libpython3.11-dev"
  "pipx"
  "python3.11-minimal"
)
optdepends=(
  "alsa-utils: for volume widget"
  "cmus: for cmus widget"
  "jupyter-console: for interaction with qtile via Jupyter"
  "khal: for khal_calendar widget"
  "lm-sensors: for sensors widget"
  "moc: for moc widget"
)

# Install Wayland backend if wlroots 0.16 is available
apt-cache show libwlroots-dev | grep -q 'Version: 0.16' && {
  depends+=("libwlroots11")
  makedepends+=("libwlroots-dev")
  optdepends+=("xwayland: for XWayland support")
}

package() {
  # Symlinking will not work correctly in this phase, but pipx needs a symlink destination,
  # so we give it a throwaway directory.
  local PIPX_VARS=(
    "PIPX_HOME=${pkgdir}/opt"
    "PIPX_BIN_DIR=${PWD}/tmp"
    "PIPX_MAN_DIR=${PWD}/tmp"
  )
  sudo "${PIPX_VARS[@]}" pipx install --force --python python3.11 --system-site-packages ".[all]"
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
