pkgname="awww-git"
gives="awww"
repology=("project: ${gives}")
pkgdesc="Efficient animated wallpaper daemon for Wayland, controlled at runtime"
pkgver="0.11.2.r82.gcb3be36"
arch=("amd64" "arm64")
url='https://codeberg.org/LGFae/awww'
license=("GPL-3.0-or-later")
depends=(
  "libxkbcommon0"
  "liblz4-1"
)
makedepends=(
  "git"
  "dav1d"
  "scdoc"
  "liblz4-dev"
  "libdav1d-dev"
  "pkg-config"
  "wayland-protocols"
  "libwayland-dev"
)
pacdeps=("rust-bin")
provides=("${gives}")
conflicts=("${gives}" "swww")
replaces=("swww")
source=("https://codeberg.org/LGFae/awww.git")
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

prepare() {
  cd "${gives}"

  export RUSTUP_TOOLCHAIN=stable && cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${gives}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build -j"${NCPU}" --locked --release --all-features

  # Generate man pages
  ./doc/gen.sh
}

check() {
  cd "${gives}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --all-features
}

package() {
  cd "${gives}"

  # Binaries
  install -Dm755 target/release/awww "${pkgdir}/usr/bin/awww"
  install -Dm755 target/release/awww-daemon "${pkgdir}/usr/bin/awww-daemon"

  # Shell completions
  install -Dm644 completions/_awww "${pkgdir}/usr/share/zsh/vendor-completions/_awww"
  install -Dm644 completions/awww.bash "${pkgdir}/usr/share/bash-completion/completions/awww"
  install -Dm644 completions/awww.fish "${pkgdir}/usr/share/fish/vendor_completions.d/awww.fish"
  install -Dm644 completions/awww.elv "${pkgdir}/usr/share/elvish/lib/awww.elv"

  # Man pages
  for man_doc in doc/generated/*; do
    install -Dm644 "${man_doc}" "${pkgdir}/usr/share/man/man1/$(basename "${man_doc}")"
  done
}
