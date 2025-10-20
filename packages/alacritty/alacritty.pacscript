pkgname="alacritty"
arch=("any")
pkgver="0.16.0"
repology=("project: alacritty")
source=("@${pkgname}~${pkgver}::https://github.com/alacritty/alacritty/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("cargo" "cmake" "pkg-config" "libfreetype6-dev" "libfontconfig1-dev" "libxcb-xfixes0-dev" "python3" "gzip" "scdoc")
pkgdesc="A fast, cross-platform, OpenGL terminal emulator"
maintainer=("Warofzen <warofzen1@protonmail.com>")
incompatible=('debian:bullseye' 'debian:bookworm')
external_connection=true
sha256sums=("7baaf26acd80f6b7ceceb2c984b0d43b4089af2d12db3cbaa60ad1243d712e72")

build() {
  cd "${pkgname}~${pkgver}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 target/release/alacritty -t "${pkgdir}/usr/bin"

  install -Dm644 extra/logo/alacritty-term.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/Alacritty.svg"

  install -Dm644 extra/linux/Alacritty.desktop -t "${pkgdir}/usr/share/applications"

  install -Dm644 extra/completions/alacritty.bash "${pkgdir}/usr/share/bash-completion/completions/alacritty"
  install -Dm644 extra/completions/alacritty.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 extra/completions/_alacritty -t "${pkgdir}/usr/share/zsh/vendor-completions"

  mkdir -p "${pkgdir}/usr/local/share/man/man1" "${pkgdir}/usr/local/share/man/man5"
  scdoc < extra/man/alacritty.1.scd | gzip -c | tee "${pkgdir}/usr/local/share/man/man1/alacritty.1.gz" > /dev/null
  scdoc < extra/man/alacritty-msg.1.scd | gzip -c | tee "${pkgdir}/usr/local/share/man/man1/alacritty-msg.1.gz" > /dev/null
  scdoc < extra/man/alacritty.5.scd | gzip -c | tee "${pkgdir}/usr/local/share/man/man5/alacritty.5.gz" > /dev/null
  scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | tee "${pkgdir}/usr/local/share/man/man5/alacritty-bindings.5.gz" > /dev/null
}
