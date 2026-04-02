pkgname="watchexec-bin"
repology=("project: watchexec")
pkgver="2.4.1"
arch=('amd64' 'arm64')
sha256sums_amd64=("50636d6d723a1f78eb6de05723362883db53bbf084f3a6e7773c170f28ee6227")
sha256sums_arm64=("64088ecdc4adc20e3babd2bf96f1385196bd7baa494c6e1018d3714ba02bf70d")
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
