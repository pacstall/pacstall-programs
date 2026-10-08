pkgname="llama-swap-bin"
pkgver="256"
gives="llama-swap"
arch=("amd64" "arm64")
repology=("project: llama-swap")
license=("MIT")
url='https://github.com/mostlygeek/llama-swap/'
pkgdesc="Reliable model swapping for any local OpenAI/Anthropic compatible server"
replaces=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-git")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>")
source_amd64=("https://github.com/mostlygeek/llama-swap/releases/download/v${pkgver}/llama-swap_${pkgver}_linux_amd64.tar.gz")
source_arm64=("https://github.com/mostlygeek/llama-swap/releases/download/v${pkgver}/llama-swap_${pkgver}_linux_arm64.tar.gz")
sha256sums_amd64=("557757336cde1a667f0b200d4a84c48c9f5fdf561fd8ae969a2bed9d8c94ec48")
sha256sums_arm64=("f921f33063a34ef25b7061d7153fbafaa954061ad131f48e84e782b22f6cd0ee")

package() {
  install -Dm755 llama-swap -t "${pkgdir}/usr/bin"
}
