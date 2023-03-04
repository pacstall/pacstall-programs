name="bat"
version="0.22.1"
url="https://github.com/sharkdp/bat/archive/refs/tags/v${version}.tar.gz"
build_depends="cargo libonig-dev pkg-config"
depends="libonig5"
replace="bat"
description="A cat(1) clone with wings"
hash="25e45debf7c86794281d63a51564feefa96fdfdf575381e3adc5c06653ecaeca"
maintainer="Orphaned"

build() {
  RUSTONIG_SYSTEM_LIBONIG=1 cargo build -j"$(nproc)" --release --locked
}

install() {
  sudo install -Dm755 target/release/bat -t "${pkgdir}/usr/bin"

  sudo install -Dm644 "$(find target -name bat.bash -print -quit)" "${pkgdir}/usr/share/bash-completion/completions/bat"
  sudo install -Dm644 "$(find target -name bat.fish -print -quit)" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  sudo install -Dm644 "$(find target -name bat.zsh -print -quit)" "${pkgdir}/usr/share/zsh/vendor-completions/_bat"

  gzip -c "$(find target -name bat.1 | head -n1)" > "${name}.1.gz"
  sudo install -Dm644 "${name}.1.gz" -t "${pkgdir}/usr/share/man/man1"

  sudo install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${name}"
}
