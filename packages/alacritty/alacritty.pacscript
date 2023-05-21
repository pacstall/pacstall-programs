name="alacritty"
version="0.12.1"
repology=("project: alacritty")
url="https://github.com/alacritty/alacritty/archive/refs/tags/v${version}.tar.gz"
build_depends=("cargo" "cmake" "pkg-config" "libfreetype6-dev" "libfontconfig1-dev" "libxcb-xfixes0-dev" "python3" "gzip")
description="A fast, cross-platform, OpenGL terminal emulator"
maintainer="Warofzen <warofzen1@protonmail.com>"
incompatible=('debian:bullseye')
hash="14bce0bfc538872c97e0e38b9233a9d1fa992dcf83a22b6035da5fe58a55bc6c"

build() {
  cargo build -j"$(nproc)" --release --locked
}

install() {
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
