pkgname="aws-cli-v2-bin"
gives="aws-cli-v2"
pkgver="2.27.40"
source=("@${pkgname}~${pkgver}::https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${pkgver}.zip")
pkgdesc="Universal Command Line Interface for Amazon Web Services v2"
depends=("groff" "less")
makedepends=("unzip")
replaces=("awscli")
repology=("project: awscli")
arch=('amd64')
sha256sums=("61aae8013cb01740d36e4aadc7b0e1fc37894c0d821a5b52ec516f473df974ea")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  ./install --install-dir "${pkgdir}/usr/local/aws-cli" --bin-dir "/usr/local/bin"

  # bash autocompletion
  echo "complete -C '/usr/local/bin/aws_completer' aws" > "aws-cli_bash_completion"

  install -Dm644 aws-cli_bash_completion "${pkgdir}/etc/bash_completion.d/${gives}"
}
