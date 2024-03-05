name="helix"
pkgver="23.10"
repology=("project: helix")
source=("https://github.com/helix-editor/helix/releases/download/${pkgver}/helix-${pkgver}-source.tar.xz")
makedepends=("cargo")
pkgdesc="A post-modern modal text editor"
hash=("4e7bcac200b1a15bc9f196bdfd161e4e448dc670359349ae14c18ccc512153e8")

build() {
  cargo build -j"${NCPU}" --release --locked
}

package() {
  sudo install -Dm755 target/release/hx -t "${pkgdir}/usr/lib/${name}"

  printf '#!/bin/sh\nHELIX_RUNTIME=/usr/lib/helix/runtime exec /usr/lib/helix/hx "$@"\n' > hx
  sudo install -Dm755 hx -t "${pkgdir}/usr/bin"

  rm -f runtime/grammars/.gitkeep
  rm -f runtime/themes/README.md
  rm -rf runtime/grammars/sources
  sudo mkdir -p "${pkgdir}/usr/lib/${name}"
  sudo cp -r runtime "${pkgdir}/usr/lib/${name}/"

  sudo install -Dm644 contrib/helix.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  sudo install -Dm644 contrib/Helix.desktop -t "${pkgdir}/usr/share/applications"

  sudo install -Dm644 contrib/completion/hx.bash "${pkgdir}/usr/share/bash-completion/completions/hx"
  sudo install -Dm644 contrib/completion/hx.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  sudo install -Dm644 contrib/completion/hx.zsh "${pkgdir}/usr/share/zsh/vendor-completions/_hx"
}
