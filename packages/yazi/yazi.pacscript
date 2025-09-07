pkgname=('yazi')
pkgver="25.5.31"
pkgrel="1"
maintainer=("DrCodfish <TheRealDrCodfish@gmail.com>")
pkgdesc="Yazi — blazing-fast terminal file manager (prebuilt binaries)"
url="https://github.com/sxyazi/yazi"
license=('MIT')
arch=('amd64' 'arm64')

source_amd64=("https://github.com/sxyazi/yazi/releases/download/v${pkgver}/yazi-x86_64-unknown-linux-gnu.zip")
source_arm64=("https://github.com/sxyazi/yazi/releases/download/v${pkgver}/yazi-aarch64-unknown-linux-gnu.zip")

sha256sums=('SKIP' 'SKIP')

depends=()
build() { :; }

package() {
  cd "${srcdir}/yazi-"*"-unknown-linux-gnu"

  # Ensure directories exist
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  install -d "${pkgdir}/usr/share/fish/vendor_completions.d"

  # Binaries
  install -Dm755 "yazi" "${pkgdir}/usr/bin/yazi"
  install -Dm755 "ya" "${pkgdir}/usr/bin/ya"

  # Documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"

  # Shell completions
  install -Dm644 "completions/ya.bash" "${pkgdir}/usr/share/bash-completion/completions/ya"
  install -Dm644 "completions/yazi.bash" "${pkgdir}/usr/share/bash-completion/completions/yazi"
  install -Dm644 "completions/_ya" "${pkgdir}/usr/share/zsh/site-functions/_ya"
  install -Dm644 "completions/_yazi" "${pkgdir}/usr/share/zsh/site-functions/_yazi"
  install -Dm644 "completions/ya.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/ya.fish"
  install -Dm644 "completions/yazi.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yazi.fish"
}

