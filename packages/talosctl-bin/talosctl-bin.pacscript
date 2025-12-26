pkgname="talosctl-bin"
gives="talosctl"
repology=("project: ${gives}")
arch=('amd64' 'arm64' 'armhf')
pkgver="1.10.5"
sha256sums_amd64=("7d7a9b053e441fb1326ee3ad7a62433f0ab5b2230e736aee1f8b25964250776b")
sha256sums_arm64=("6e98f1aa8890b93d9dcc2f496f61ab778a0f24fcde59849905b739de10ebdd30")
sha256sums_armhf=("452381a0983c28f6602c15ca5c38e701b9a60b27c7647fd7afd1183bca6b6a6f")
source_amd64=("${gives}~${pkgver}::https://github.com/siderolabs/talos/releases/download/v${pkgver}/talosctl-linux-amd64")
source_arm64=("${gives}~${pkgver}::https://github.com/siderolabs/talos/releases/download/v${pkgver}/talosctl-linux-arm64")
source_armhf=("${gives}~${pkgver}::https://github.com/siderolabs/talos/releases/download/v${pkgver}/talosctl-linux-armv7")
pkgdesc="CLI tool for managing Talos Linux clusters securely"
maintainer=("faelau <git@faessler.sh>")

package() {
  install -Dm755 "${gives}~${pkgver}" "${pkgdir}/usr/bin/${gives}"
  # install shell completions
  "${pkgdir}/usr/bin/${gives}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${gives}"
  "${pkgdir}/usr/bin/${gives}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${gives}.fish"
  "${pkgdir}/usr/bin/${gives}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${gives}"
}
