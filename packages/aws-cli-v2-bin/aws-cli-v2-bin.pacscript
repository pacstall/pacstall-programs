name="aws-cli-v2-bin"
pkgname="aws-cli-v2"
pkgver="2.15.4"
url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${pkgver}.zip"
pkgdesc="Universal Command Line Interface for Amazon Web Services v2"
depends=("groff" "less")
makedepends=("unzip")
replace=("awscli")
repology=("project: awscli")
arch=('amd64')
hash="378ddbd92cb6c26efc10bd354bef140bb7e42a446cc20ac66dd8d50e3d57c599"
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo ./install --install-dir "${pkgdir}/usr/local/aws-cli" --bin-dir "/usr/local/bin"

  # bash autocompletion
  echo "complete -C '/usr/local/bin/aws_completer' aws" > "aws-cli_bash_completion"

  sudo install -Dm644 aws-cli_bash_completion "${pkgdir}/etc/bash_completion.d/${pkgname}"
}

post_remove() {
  sudo rm -f /usr/local/bin/aws
  sudo rm -f /usr/local/bin/aws_completer
  sudo rm -rf /usr/local/aws-cli/
}
