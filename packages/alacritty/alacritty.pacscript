name="alacritty"
pkgver="0.13.1"
repology=("project: alacritty")
source=("https://github.com/alacritty/alacritty/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("cargo" "cmake" "pkg-config" "libfreetype6-dev" "libfontconfig1-dev" "libxcb-xfixes0-dev" "python3" "gzip" "scdoc")
pkgdesc="A fast, cross-platform, OpenGL terminal emulator"
maintainer="Warofzen <warofzen1@protonmail.com>"
incompatible=('debian:bullseye' 'debian:bookworm')
hash=("38a42e23e1e6faaa9e300347df3f7b58b6182908a701517aac6e296fbdf37451")

build() {
  cargo build -j"${NCPU}" --release --locked
}

package() {
  sudo install -Dm755 target/release/alacritty -t "${pkgdir}/usr/bin"

  sudo install -Dm644 extra/logo/alacritty-term.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/Alacritty.svg"

  sudo install -Dm644 extra/linux/Alacritty.desktop -t "${pkgdir}/usr/share/applications"

  sudo install -Dm644 extra/completions/alacritty.bash "${pkgdir}/usr/share/bash-completion/completions/alacritty"
  sudo install -Dm644 extra/completions/alacritty.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  sudo install -Dm644 extra/completions/_alacritty -t "${pkgdir}/usr/share/zsh/vendor-completions"

  sudo mkdir -p "${pkgdir}/usr/local/share/man/man1" "${pkgdir}/usr/local/share/man/man5"
  scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee "${pkgdir}/usr/local/share/man/man1/alacritty.1.gz" > /dev/null
  scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee "${pkgdir}/usr/local/share/man/man1/alacritty-msg.1.gz" > /dev/null
  scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee "${pkgdir}/usr/local/share/man/man5/alacritty.5.gz" > /dev/null
  scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee "${pkgdir}/usr/local/share/man/man5/alacritty-bindings.5.gz" > /dev/null
}
