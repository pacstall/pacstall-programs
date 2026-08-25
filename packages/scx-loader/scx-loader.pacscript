pkgname="scx-loader"
pkgdesc="System daemon and DBus-based loader for sched-ext schedulers"
repology=("project: scx-loader")
arch=('x86_64')
pkgver="1.1.2"
url='https://github.com/sched-ext/scx-loader'
license=('GPL-2.0-only')
_commit='cb98827b9864eec956c48ad51399e8bbb7618e1d'
source=("git+https://github.com/sched-ext/${pkgname}#commit=${_commit}")
sha256sums=('SKIP')
provides=("${pkgname}")
conflicts=("${pkgname}")
pacdeps=("scx-scheds")
depends=(
  "libgcc-s1"
  "polkitd"
)
makedepends=(
  "cargo>=1.95 | rustup"
  "build-essential"
  "clang"
  "llvm"
  "pkg-config"
)
backup=('usr/share/scx_loader/config.toml')
maintainer=("pejuton <pejuton@proton.me>")
external_connection=true

prepare() {
  cd "${pkgname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_HOME="${srcdir}/rustup-home"
  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "${AARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_HOME="${srcdir}/rustup-home"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable

  cargo build --release --frozen --all-features --workspace --jobs "${NCPU}"
}

package() {
  cd "${pkgname}"

  install -vDm755 target/release/scx_loader -t "${pkgdir}/usr/bin/"
  install -vDm755 target/release/scxctl -t "${pkgdir}/usr/bin/"

  # Install runtime assets via xtask
  # (systemd units, D-Bus services, configs, sample files)
  ./target/release/xtask install --destdir "${pkgdir}"
}

pre_install() {
  # scx.service from scx-scheds must be disabled
  if [[ -x "/usr/bin/systemctl" ]]; then
    if systemctl -q is-active scx.service 2> /dev/null; then
      systemctl stop scx.service || true
    fi
    if systemctl -q is-enabled scx.service 2> /dev/null; then
      systemctl disable scx.service || true
    fi
  fi
}

pre_remove() {
  if [[ -x "/usr/bin/systemctl" ]]; then
    if systemctl -q is-active scx_loader.service 2> /dev/null; then
      systemctl stop scx_loader.service || true
      fancy_message warn "Stopped 'scx_loader.service'. If package upgrade or reinstall, start it again after install."
    fi
    if systemctl -q is-enabled scx_loader.service 2> /dev/null; then
      systemctl disable scx_loader.service || true
      fancy_message warn "Disabled 'scx_loader.service'. If package upgrade or reinstall, enable it again after install."
    fi
  fi
}
