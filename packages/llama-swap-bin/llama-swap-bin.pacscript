pkgname="llama-swap-bin"
pkgver="252"
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
sha256sum_amd64=("5f858d72a90ae28aa7c75d34df25d05f9d7daec8c47b9503fb8a264bc6d95d25")
sha256sum_arm64=("19d204a821db038759123088b6e9d3357c4d13bcec0cef0c1bc75e3dcebf60ec")

package() {
  install -Dm755 llama-swap -t "${pkgdir}/usr/bin"
}
