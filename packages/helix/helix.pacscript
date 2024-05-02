pkgname="helix"
pkgver="24.03"
repology=("project: helix")
source=("https://github.com/helix-editor/helix/releases/download/${pkgver}/helix-${pkgver}-source.tar.xz")
makedepends=("cargo")
pkgdesc="A post-modern modal text editor"
sha256sums=("c59a5988f066c2ab90132e03a0e6b35b3dd89f48d3d78bf0ec81bd7d88c7677e")

build() {
  cd "${_archive}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${_archive}"
  install -Dm755 target/release/hx -t "${pkgdir}/usr/lib/${pkgname}"

  printf '#!/bin/sh\nHELIX_RUNTIME=/usr/lib/helix/runtime exec /usr/lib/helix/hx "$@"\n' > hx
  install -Dm755 hx -t "${pkgdir}/usr/bin"

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
