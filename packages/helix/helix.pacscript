pkgname="helix"
arch=("any")
pkgver="25.01.1"
repology=("project: helix")
source=("@${pkgname}~${pkgver}::https://github.com/helix-editor/helix/releases/download/${pkgver}/helix-${pkgver}-source.tar.xz")
makedepends=("cargo>=1.76.0")
pkgdesc="A post-modern modal text editor"
external_connection=true
sha256sums=("12508c4f5b9ae6342299bd40d281cd9582d3b51487bffe798f3889cb8f931609")

build() {
  cd "${pkgname}~${pkgver}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 target/release/hx -t "${pkgdir}/usr/lib/${pkgname}"

  printf '#!/bin/sh\nHELIX_RUNTIME=/usr/lib/helix/runtime exec /usr/lib/helix/hx "$@"\n' > hx
  install -Dm755 hx -t "${pkgdir}/usr/bin"
  ln -sf /usr/bin/hx "${pkgdir}/usr/bin/helix"

  rm -f runtime/grammars/.gitkeep
  rm -f runtime/themes/README.md
  rm -rf runtime/grammars/sources
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r runtime "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm644 contrib/helix.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 contrib/Helix.desktop -t "${pkgdir}/usr/share/applications"

  install -Dm644 contrib/completion/hx.bash "${pkgdir}/usr/share/bash-completion/completions/hx"
  install -Dm644 contrib/completion/hx.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 contrib/completion/hx.zsh "${pkgdir}/usr/share/zsh/vendor-completions/_hx"
}
