name="ghcup-bin"
gives="ghcup"
pkgver="0.1.22.0"
pkgdesc="Installer for Haskell, a general-purpose programming language"
arch=('amd64' 'arm64' 'arm' 'i386')
homepage='https://www.haskell.org/ghcup/'
breaks=("${gives}-git")
maintainer="vigress8 <vig@disroot.org>"
repology=("project: ${gives}")

case "${CARCH}" in
  amd64)
    gnuarch="x86_64"
    hash='bf213f4dfd2271b46ca52e2f14e96850ce32e9115e5acc90f1dc5a4e815e32af'
    ;;
  arm64)
    gnuarch="aarch64"
    hash='3eda556959462579b73558616646c9fc01a583acc7a4611bb21a32706deae142'
    ;;
  arm)
    gnuarch="armv7"
    hash='7c66253e52c5fb627a4d4b203a69e69f4d7732348ad6a830a41d7e2d79a61c5d'
    ;;
  i386)
    gnuarch="i386"
    hash='1fd4fa989653a127d33f90cb4cc11fd024ea4085e795c0b0f6ed97afc5e8b634'
    ;;
  *) ;;
esac

url="https://downloads.haskell.org/~ghcup/${pkgver}/${gnuarch}-linux-ghcup-${pkgver}"

package() {
  sudo install -Dm755 "${gnuarch}-linux-ghcup-${pkgver}" "${pkgdir}/usr/bin/ghcup"
  _install_completion bash bash-completion/completions/ghcup
  _install_completion zsh zsh/site-functions/_ghcup
  _install_completion fish fish/vendor_completions.d/ghcup.fish
}

_install_completion() {
  local shell="$1" location="$2"
  "${pkgdir}/usr/bin/ghcup" "--${shell}-completion-script" /usr/bin/ghcup > "${shell}-temp"
  sudo install -Dm644 "${shell}-temp" "${pkgdir}/usr/share/${location}"
}

post_install() {
  fancy_message info
  cat <<'EOM'
ghcup requires $GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin to be in your PATH.
By default, $GHCUP_INSTALL_BASE_PREFIX == $HOME.
Alternatively, when GHCUP_USE_XDG_DIRS is set, ghcup uses XDG-style directories.

EOM
}
