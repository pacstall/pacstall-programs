name="helix"
version="23.03"
repology=("project: helix")
url="https://github.com/helix-editor/helix/releases/download/${version}/helix-${version}-source.tar.xz"
build_depends=("cargo")
description="A post-modern modal text editor"
maintainer="Marcin Puc <tranzystorek.io@protonmail.com>"
hash="60e5d8927f2f43807ff4ed3c96e7071746ce23d0b7ebaa27e380723726710703"

build() {
  cargo build -j"$(nproc)" --release --locked
}

install() {
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
