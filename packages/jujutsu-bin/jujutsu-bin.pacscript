pkgname="jujutsu-bin"
gives="jujutsu"
repology=("project: jujutsu")
pkgver="0.43.0"
pkgdesc="Git-compatible VCS that is both simple and powerful"
url="https://github.com/jj-vcs/jj"
arch=("amd64" "arm64")
license=("Apache-2.0")
maintainer=("Rodrigo Tavares <dev@rodrigotavar.es>")

_base_url="https://github.com/jj-vcs/jj/releases/download/v${pkgver}"

source_amd64=("${pkgname}-${pkgver}-amd64.tar.gz::${_base_url}/jj-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_amd64=("59e5588583ac82b623239929368c65b90735931c0f26b5a16c1f04d5bb97643d")

source_arm64=("${pkgname}-${pkgver}-arm64.tar.gz::${_base_url}/jj-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_arm64=("289197b6bec60b4e57d47260624b617716f737eb02cdfd9155791b2576aa5862")

build() {
  mkdir -p completions
  ./jj util completion bash > completions/jj
  ./jj util completion zsh > completions/_jj
  ./jj util completion fish > completions/jj.fish
}

package() {
  install -Dm755 jj -t "${pkgdir}/usr/bin"
  install -Dm644 completions/jj -t "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm644 completions/_jj -t "${pkgdir}/usr/share/zsh/vendor-completions"
  install -Dm644 completions/jj.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
}
