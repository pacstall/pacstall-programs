pkgname="scx-scheds"
pkgdesc="sched_ext schedulers and tools"
repology=("project: scx-scheds")
arch=('x86_64')
pkgver="1.1.0"
url='https://github.com/sched-ext/scx'
license=('GPL-2.0-only')
_gitname='scx'
_commit='c505008f6cf917b86950734eb869048e1a462fa0'
source=("git+https://github.com/sched-ext/${_gitname}#commit=${_commit}")
sha256sums=('SKIP')
provides=("${pkgname}")
conflicts=("${pkgname}")
limit_kver=">=6.12"
incompatible=("debian:bullseye" "debian:bookworm" "ubuntu:jammy" "ubuntu:noble")
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
  "cargo>=1.82"
  "build-essential"
  "cmake"
  "rustc"
  "clang"
  "llvm"
  "pkg-config"
  "libelf-dev"
  "protobuf-compiler"
  "libseccomp-dev"
  "libbpf-dev"
  "pahole"
)
recommends=("scx-loader")
backup=('etc/default/scx')
maintainer=("pejuton <pejuton@proton.me>")
external_connection=true

prepare() {
  cd "${_gitname}"

  export CARGO_HOME="${srcdir}/cargo-home"

  cargo fetch --locked --target "${AARCH}-unknown-linux-gnu"
}

build() {
  cd "${_gitname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target

  cargo build \
    --release \
    --frozen \
    --all-features \
    --workspace \
    --jobs "${NCPU}" \
    --exclude scx_mitosis \
    --exclude scx_rlfifo \
    --exclude scx_wd40 \
    --exclude scxcash \
    --exclude xtask \
    --exclude vmlinux_docify \
    --exclude scx_arena_selftests \
    --exclude scx_bpf_unittests
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
  # Stop systemd service if started
  if (systemctl -q is-active scx.service); then
    systemctl stop -v scx.service
    fancy_message warn "Stopped 'scx.service'. If package upgrade or reinstall, start it again after install."
  fi

  # Disable systemd service if enabled
  if (systemctl -q is-enabled scx.service); then
    systemctl disable -v scx.service
    fancy_message warn "Disabled 'scx.service'. If package upgrade or reinstall, enable it again after install."
  fi
}

post_install() {
  fancy_message info "Start/enable systemd service 'scx.service' or use 'scx-loader'."
  fancy_message info "scx.service configuration in '/etc/default/scx'."
}
