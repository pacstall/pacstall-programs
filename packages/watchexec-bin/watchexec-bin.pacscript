name="watchexec-bin"
repology=("project: watchexec")
pkgver="1.25.1"
arch=('amd64' 'arm64')
if [[ ${CARCH} == amd64 ]]; then
    hash="16c92ce0b13f4b0082b8a8362ac099fa5ae417780255990302e4865c2a8cd1bc"
    arch_prefix="x86_64"
else
    hash="a8ccd6770d0c0cceace33e5c668f236aaa5292bf77711a6afaefceb0bf8b87c7"
    arch_prefix="aarch64"
fi
url="https://github.com/watchexec/watchexec/releases/download/v${pkgver}/watchexec-${pkgver}-${arch_prefix}-unknown-linux-gnu.tar.xz"
pkgdesc="Executes commands in response to file modifications"
homepage='https://watchexec.github.io/'
maintainer="Andrew Barchuk <andrew@raindev.io>"

package() {
  sudo install -Dm755 "./watchexec" -t "${pkgdir}/usr/bin"
  sudo install -Dm644 "./watchexec.1" -t "${pkgdir}/usr/share/man/man1"
  sudo install -Dm644 "./completions/bash" "${pkgdir}/usr/share/bash-completion/completions/watchexec"
}

# vim:set ft=sh ts=2 sw=2 et:
