pkgname="yazi-git"
gives="yazi"
pkgdesc="Blazing fast terminal file manager written in Rust"
url='https://yazi-rs.github.io'
pkgver="0.r0"
arch=("amd64" "arm64")
source=("git+https://github.com/sxyazi/yazi.git")
external_connection=true
_min_cargo='1.95'
makedepends=(
  "file"
  "git"
  "ffmpeg"
  "p7zip-full"
  "jq"
  "poppler-utils"
  "fd-find"
  "ripgrep"
  "fzf"
  "zoxide"
  "imagemagick"
  "wl-clipboard"
  "xclip"
  "build-essential"
  "libgcc-12-dev"
  "glibc-source"
  "cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup"
)

build() {
  cd "${srcdir}/yazi"

  export CARGO_HOME="${srcdir}/cargo-cache"
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${srcdir}/yazi"

  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/yazi"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/ya"
}
