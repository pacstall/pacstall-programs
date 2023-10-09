name="aws-cli-v2-bin"
pkgname="aws-cli-v2"
pkgver="2.13.25"
url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${pkgver}.zip"
pkgdesc="Universal Command Line Interface for Amazon Web Services v2"
depends=("groff" "less")
makedepends=("unzip")
replace=("awscli")
repology=("project: awscli")
arch=('amd64')
hash="b73bc4821fc674120ccf299848fc586e12297456273c509c66f3b168a28338f8"
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
