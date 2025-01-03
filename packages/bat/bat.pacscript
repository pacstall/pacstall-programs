pkgname="bat"
arch=("any")
pkgver="0.24.0"
source=("@${pkgname}~${pkgver}::https://github.com/sharkdp/bat/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("cargo" "libonig-dev" "pkg-config")
depends=("libonig5")
replaces=("bat")
pkgdesc="A cat(1) clone with wings"
external_connection=true
sha256sums=("907554a9eff239f256ee8fe05a922aad84febe4fe10a499def72a4557e9eedfb")

build() {
  cd "${pkgname}~${pkgver}"
  RUSTONIG_SYSTEM_LIBONIG=1 cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 target/release/bat -t "${pkgdir}/usr/bin"

  install -Dm644 "$(find target -name bat.bash -print -quit)" "${pkgdir}/usr/share/bash-completion/completions/bat"
  install -Dm644 "$(find target -name bat.fish -print -quit)" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 "$(find target -name bat.zsh -print -quit)" "${pkgdir}/usr/share/zsh/vendor-completions/_bat"

  gzip -c "$(find target -name bat.1 | head -n1)" > "${pkgname}.1.gz"
  install -Dm644 "${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1"

  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
