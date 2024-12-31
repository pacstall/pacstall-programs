pkgname="watchexec-bin"
repology=("project: watchexec")
pkgver="1.25.1"
arch=('amd64' 'arm64')
sha256sums_amd64=("16c92ce0b13f4b0082b8a8362ac099fa5ae417780255990302e4865c2a8cd1bc")
sha256sums_arm64=("a8ccd6770d0c0cceace33e5c668f236aaa5292bf77711a6afaefceb0bf8b87c7")
source_amd64=("@${pkgname}~${pkgver}::https://github.com/watchexec/watchexec/releases/download/v${pkgver}/watchexec-${pkgver}-x86_64-unknown-linux-gnu.tar.xz")
source_arm64=("@${pkgname}~${pkgver}::https://github.com/watchexec/watchexec/releases/download/v${pkgver}/watchexec-${pkgver}-aarch64-unknown-linux-gnu.tar.xz")
pkgdesc="Executes commands in response to file modifications"
url='https://watchexec.github.io/'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "./watchexec" -t "${pkgdir}/usr/bin"
  install -Dm644 "./watchexec.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "./completions/bash" "${pkgdir}/usr/share/bash-completion/completions/watchexec"
}

# vim:set ft=sh ts=2 sw=2 et:
