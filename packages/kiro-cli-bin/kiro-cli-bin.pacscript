pkgname="kiro-cli-bin"
gives="kiro-cli"
repology=("project: kiro-cli")
pkgver="2.9.0"
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
sha256sums_amd64=("ee9ef0a203f7e1d73585c377cb993b506828bd3121d7f037390e06efbc054267")
source_arm64=("${pkgname}-${pkgver}-arm64.tar.zst::${_base_url}/kirocli-aarch64-linux.tar.zst")
sha256sums_arm64=("f535d9466d27c56604053b5fa9ff8f22fcdd345b57b735f7bee84fdee7f49bbf")

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
