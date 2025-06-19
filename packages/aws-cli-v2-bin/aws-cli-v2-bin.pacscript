pkgname="aws-cli-v2-bin"
gives="aws-cli-v2"
pkgver="2.27.38"
source=("@${pkgname}~${pkgver}::https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${pkgver}.zip")
pkgdesc="Universal Command Line Interface for Amazon Web Services v2"
depends=("groff" "less")
makedepends=("unzip")
replaces=("awscli")
repology=("project: awscli")
arch=('amd64')
sha256sums=("b3f281586ac737f83a7af247aa302c4a03e16a685f06f7023e99e8df67f16ced")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  ./install --install-dir "${pkgdir}/usr/local/aws-cli" --bin-dir "/usr/local/bin"

  # bash autocompletion
  echo "complete -C '/usr/local/bin/aws_completer' aws" > "aws-cli_bash_completion"

  install -Dm644 aws-cli_bash_completion "${pkgdir}/etc/bash_completion.d/${gives}"
}
