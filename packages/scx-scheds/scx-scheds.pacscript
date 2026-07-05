pkgname="scx-scheds"
pkgdesc="sched_ext schedulers and tools"
repology=("project: scx-scheds")
arch=('x86_64')
pkgver="1.1.2"
url='https://github.com/sched-ext/scx'
license=('GPL-2.0-only')
_gitname='scx'
_commit='b68cb3c829312b43785225bcfd445a3ecefef5c2'
source=("git+https://github.com/sched-ext/${_gitname}#commit=${_commit}")
sha256sums=('SKIP')
provides=("${pkgname}")
conflicts=("${pkgname}")
limit_kver=">=6.12"
incompatible=("debian:bullseye" "debian:bookworm" "debian:trixie" "ubuntu:jammy" "ubuntu:noble")
depends=(
  "bash"
  "bpftool"
  "libgcc-s1"
  "libseccomp2"
  "libbpf1>=1.3"
  "libelf1t64"
  "libprotobuf32t64"
  "zlib1g"
)
makedepends=(
  "cargo>=1.94.1 | rustup"
  "build-essential"
  "clang"
  "llvm"
  "pkg-config"
  "libelf-dev"
  "protobuf-compiler"
  "libseccomp-dev"
  "libbpf-dev"
  "libzstd-dev"
  "zlib1g-dev"
  "pahole"
  "make"
  "cmake"
  "gcc"
  "autoconf"
  "autopoint"
  "flex"
  "bison"
  "gawk"
)
recommends=("scx-loader")
backup=('etc/default/scx')
maintainer=("pejuton <pejuton@proton.me>")
external_connection=true

prepare() {
  cd "${_gitname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_HOME="${srcdir}/rustup-home"
  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "${AARCH}-unknown-linux-gnu"
}

build() {
  cd "${_gitname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_HOME="${srcdir}/rustup-home"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable

  cargo build \
    --release \
    --frozen \
    --all-features \
    --workspace \
    --jobs "${NCPU}" \
    --exclude scx_forge \
    --exclude scx_flow \
    --exclude scx_rlfifo \
    --exclude xtask \
    --exclude vmlinux_docify \
    --exclude scx_arena_selftests \
    --exclude scx_characterize \
    --exclude scx_forge_agent
}

package() {
  cd "${_gitname}"

  # Install all built executables (skip .so and .d files)
  find target/release \
    -maxdepth 1 -type f -executable ! -name '*.so' \
    -exec install -vDm755 -t "${pkgdir}/usr/bin/" {} +

  # Systemd service
  install -vDm644 services/scx.service -t "${pkgdir}/usr/lib/systemd/system"
  install -vDm644 services/scx -t "${pkgdir}/etc/default"
}

pre_remove() {
  if [[ -x "/usr/bin/systemctl" ]]; then
    if systemctl -q is-active scx.service 2> /dev/null; then
      systemctl stop scx.service || true
      fancy_message warn "Stopped 'scx.service'. If package upgrade or reinstall, start it again after install."
    fi
    if systemctl -q is-enabled scx.service 2> /dev/null; then
      systemctl disable scx.service || true
      fancy_message warn "Disabled 'scx.service'. If package upgrade or reinstall, enable it again after install."
    fi
  fi
}

post_install() {
  fancy_message info "Start/enable systemd service 'scx.service' or use 'scx-loader'."
  fancy_message info "scx.service configuration in '/etc/default/scx'."
}
