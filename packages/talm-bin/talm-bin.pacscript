pkgname="talm-bin"
gives="talm"
breaks=("${gives}")
repology=("project: ${gives}")
arch=('amd64' 'arm64' 'i386')
pkgver="0.15.0"
sha256sums_amd64=("8283ba822d2d2da93be633ee9123992ab918412a6d2da4af6c7863de109e6178")
sha256sums_arm64=("a068cf8eda490e1203a762eb0016a6c9688247253381229ee407da4ee8d364a3")
sha256sums_i386=("f840826eb84daea7fddc6fb9feaceda7968bce6afd5101e0b48c983eb50f0533")
source_amd64=("${gives}~${pkgver}::https://github.com/cozystack/talm/releases/download/v${pkgver}/talm-linux-amd64.tar.gz")
source_arm64=("${gives}~${pkgver}::https://github.com/cozystack/talm/releases/download/v${pkgver}/talm-linux-arm64.tar.gz")
source_i386=("${gives}~${pkgver}::https://github.com/cozystack/talm/releases/download/v${pkgver}/talm-linux-i386.tar.gz")
pkgdesc="Manage Talos Linux the GitOps Way!"
maintainer=("faelau <git@faessler.sh>")

package() {
  install -Dm755 talm "${pkgdir}/usr/bin/${gives}"
  # install shell completions
  "${pkgdir}/usr/bin/${gives}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/talm"
  "${pkgdir}/usr/bin/${gives}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/talm.fish"
  "${pkgdir}/usr/bin/${gives}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_talm"
}
