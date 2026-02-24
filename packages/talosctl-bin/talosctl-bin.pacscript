pkgname="talosctl-bin"
gives="talosctl"
repology=("project: ${gives}")
arch=('amd64' 'arm64' 'armhf')
pkgver="1.12.4"
sha256sums_amd64=("6b85f633721e02d31c8a28a633c9cd8ebfb7e41677ff29e94236a082d4cd6cd9")
sha256sums_arm64=("5d6f37684d337a9b689216a4e7cc07b58996bad34afbd9d032ab1bd058cfe282")
sha256sums_armhf=("1a78c6752ec3613062de93aa989ac7603eeb866ec7a76e2e43cc8bfe4ce7e554")
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
