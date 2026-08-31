pkgname="llama-swap-bin"
pkgver="251"
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
sha256sum_amd64=("85bd7f231f5777ff6b8b787a794f825678b8d042cd4484044516a58ecdc7622b")
sha256sum_arm64=("777bfa16b2ef6a78ad36f1e0c28b5dd4adda1dc0cc9aea32b6fba8e1c5a41de9")

package() {
  install -Dm755 llama-swap -t "${pkgdir}/usr/bin"
}
