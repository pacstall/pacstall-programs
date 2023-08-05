name="alacritty"
pkgver="0.12.2"
repology=("project: alacritty")
url="https://github.com/alacritty/alacritty/archive/refs/tags/v${pkgver}.tar.gz"
makedepends=("cargo" "cmake" "pkg-config" "libfreetype6-dev" "libfontconfig1-dev" "libxcb-xfixes0-dev" "python3" "gzip")
pkgdesc="A fast, cross-platform, OpenGL terminal emulator"
maintainer="Warofzen <warofzen1@protonmail.com>"
incompatible=('debian:bullseye')
hash="285b44d2d2e83118ab7fe61d575811bb85d5e21147808171bd0e583e9e794748"

build() {
  cargo build -j"$(nproc)" --release --locked
}

package() {
  sudo install -Dm755 target/release/alacritty -t "${pkgdir}/usr/bin"

  sudo install -Dm644 extra/logo/alacritty-term.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/Alacritty.svg"

  sudo install -Dm644 extra/linux/Alacritty.desktop -t "${pkgdir}/usr/share/applications"

  sudo install -Dm644 extra/completions/alacritty.bash "${pkgdir}/usr/share/bash-completion/completions/alacritty"
  sudo install -Dm644 extra/completions/alacritty.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  sudo install -Dm644 extra/completions/_alacritty -t "${pkgdir}/usr/share/zsh/vendor-completions"

  gzip -c extra/alacritty.man > alacritty.1.gz
  sudo install -Dm644 alacritty.1.gz -t "${pkgdir}/usr/share/man/man1"

  sudo install -Dm644 alacritty.yml -t "${pkgdir}/usr/share/examples/alacritty"
}
