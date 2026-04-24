pkgname="kiro-cli-bin"
gives="kiro-cli"
repology=("project: kiro-cli")
pkgver="2.0.0"
pkgrel="1"
pkgdesc="AI-powered agentic coding assistant for the terminal"
url='https://kiro.dev/cli/'
arch=('amd64' 'arm64')
# By downloading and using Kiro CLI, you agree to the following:
# AWS Customer Agreement: https://aws.amazon.com/agreement/
# AWS Intellectual Property License: https://aws.amazon.com/legal/aws-ip-license-terms/
# Service Terms: https://aws.amazon.com/service-terms/
# Privacy Notice: https://aws.amazon.com/privacy/
license=('custom:Kiro')
depends=('libc6' 'libgcc-s1')
conflicts=('amazon-q-cli-bin')
breaks=('amazon-q-cli-bin')
replaces=('amazon-q-cli-bin')
maintainer=("Rodrigo Tavares <dev@rodrigotavar.es>")
_base_url="https://desktop-release.q.us-east-1.amazonaws.com/${pkgver}"
source_amd64=("${pkgname}-${pkgver}-amd64.tar.zst::${_base_url}/kirocli-x86_64-linux.tar.zst")
sha256sums_amd64=("53f0a97f910394e3e07e2f363f0adea3d2a4811d5322fe12d675a9bf45cf181c")
source_arm64=("${pkgname}-${pkgver}-arm64.tar.zst::${_base_url}/kirocli-aarch64-linux.tar.zst")
sha256sums_arm64=("702441c7729beb33348e00972c27767569ff03022ab18a51b9294b7f418f7243")

prepare() {
  cd kirocli/bin
  # shellcheck disable=SC2016
  sed -i 's|\$HOME/.local/bin/kiro-cli|/usr/bin/kiro-cli|g' q qchat
}

build() {
  cd kirocli
  mkdir -p completions
  ./bin/kiro-cli completion bash > completions/kiro-cli
  ./bin/kiro-cli completion zsh > completions/_kiro-cli
  ./bin/kiro-cli completion fish > completions/kiro-cli.fish
}

package() {
  cd kirocli
  install -Dm755 bin/kiro-cli -t "${pkgdir}/usr/bin"
  install -Dm755 bin/kiro-cli-chat -t "${pkgdir}/usr/bin"
  install -Dm755 bin/kiro-cli-term -t "${pkgdir}/usr/bin"
  install -Dm755 bin/q -t "${pkgdir}/usr/bin"
  install -Dm755 bin/qchat -t "${pkgdir}/usr/bin"
  install -Dm644 completions/kiro-cli -t "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm644 completions/_kiro-cli -t "${pkgdir}/usr/share/zsh/vendor-completions"
  install -Dm644 completions/kiro-cli.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
}
