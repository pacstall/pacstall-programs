pkgname="watchexec-bin"
repology=("project: watchexec")
pkgver="2.3.2"
arch=('amd64' 'arm64')
sha256sums_amd64=("21ac2d0825225e14f7d7c1de0b33d55f657c4bd64bdab6908d773396283c75ba")
sha256sums_arm64=("ee76f5707e6cedf91f5d3d35ce9ff9391b1c1bbbccfa946c57a1a29828276490")
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
