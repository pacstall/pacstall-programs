pkgname="kiro-cli-bin"
gives="kiro-cli"
repology=("project: kiro-cli")
pkgver="3.5.0"
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
sha256sums_amd64=("d7fb9b1bdc601ef9b05df889113fa6a9e4f532c4e6b0ac363c985d4983e6e506")
source_arm64=("${pkgname}-${pkgver}-arm64.tar.zst::${_base_url}/kirocli-aarch64-linux.tar.zst")
sha256sums_arm64=("0eaeec9a8d86c851c846b02b05ad104061f8bbffb5f7d01772e1e6ce9d4d7d1c")

package() {
  cd kirocli
  install -Dm755 bin/kiro-cli -t "${pkgdir}/usr/bin"
}
