name="aws-cli-v2-bin"
pkgname="aws-cli-v2"
version="2.9.11"
url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${version}.zip"
description="Universal Command Line Interface for Amazon Web Services v2"
depends="groff less"
build_depends="unzip"
replace="awscli"
repology=("project: awscli")
arch=('amd64')
hash="20826e1647c45c1e28715eb32dd073e8106c9a11506624af6e4c2d628fac9f92"

install() {
  sudo ./install --install-dir "${pkgdir}/usr/local/aws-cli" --bin-dir "/usr/local/bin"

  # bash autocompletion
  echo "complete -C '/usr/local/bin/aws_completer' aws" > "aws-cli_bash_completion"

  sudo install -Dm644 aws-cli_bash_completion "${pkgdir}/etc/bash_completion.d/${pkgname}"
}

removescript() {
  sudo rm -f /usr/local/bin/aws
  sudo rm -f /usr/local/bin/aws_completer
}
