pkgname="aws-cli-v2-bin"
gives="aws-cli-v2"
pkgver="2.15.44"
source=("https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${pkgver}.zip")
pkgdesc="Universal Command Line Interface for Amazon Web Services v2"
depends=("groff" "less")
makedepends=("unzip")
replaces=("awscli")
repology=("project: awscli")
arch=('amd64')
sha256sums=("a825bec454b46cb1203a98092a95504c94872973e132a1c22befd8c0b11c859f")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  ./install --install-dir "${pkgdir}/usr/local/aws-cli" --bin-dir "/usr/local/bin"

  # bash autocompletion
  echo "complete -C '/usr/local/bin/aws_completer' aws" > "aws-cli_bash_completion"

  install -Dm644 aws-cli_bash_completion "${pkgdir}/etc/bash_completion.d/${gives}"
}
