pkgname="ghcup-bin"
gives="ghcup"
pkgver="0.1.30.0"
pkgdesc="Installer for Haskell, a general-purpose programming language"
arch=('amd64' 'arm64' 'armhf' 'i386')
depends=('libgmp-dev')
optdepends=('curl: downloader' 'wget: downloader')
url='https://www.haskell.org/ghcup/'
breaks=("${gives}-git")
repology=("project: ${gives}")

_baseurl="https://downloads.haskell.org/~${gives}/${pkgver}"
source_amd64=("${gives}::${_baseurl}/x86_64-linux-${gives}-${pkgver}")
sha256sums_amd64=("fea4499d0cbdf71c554bfb7febebb81d1bcd09a4c4cfb7a90905ef9bff4931cb")
source_arm64=("${gives}::${_baseurl}/aarch64-linux-${gives}-${pkgver}")
sha256sums_arm64=("20e7d3f4e4dfd3583f3af9f37d61ca19595c4c48bc318dffcf61f425ea1eda03")
source_armhf=("${gives}::${_baseurl}/armv7-linux-${gives}-${pkgver}")
sha256sums_armhf=("6dfbe24f1a6e0e0a916d0e22739b7f926b1e020731707a1aacb2579bd7ddf77f")
source_i386=("${gives}::${_baseurl}/i386-linux-${gives}-${pkgver}")
sha256sums_i386=("7267e2a77ff57fe71908dffae7970e560caf75536d50211d5c11555b673972f1")

package() {
  install -Dm755 ./"${gives}" -t "${pkgdir}/usr/bin"
  _install_completion bash bash-completion/completions/ghcup
  _install_completion zsh zsh/site-functions/_ghcup
  _install_completion fish fish/vendor_completions.d/ghcup.fish
}

_install_completion() {
  local shell="$1" dest="$2"
  "${pkgdir}/usr/bin/ghcup" "--${shell}-completion-script" /usr/bin/ghcup > "${shell}-temp"
  install -Dm644 "${shell}-temp" "${pkgdir}/usr/share/${dest}"
}

post_install() {
  fancy_message info
  cat << 'EOM'
ghcup requires $GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin to be in your PATH.
By default, $GHCUP_INSTALL_BASE_PREFIX == $HOME.
Alternatively, when GHCUP_USE_XDG_DIRS is set, ghcup uses XDG-style directories.

EOM
}
