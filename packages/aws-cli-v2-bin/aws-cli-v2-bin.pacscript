name="aws-cli-v2-bin"
pkgname="aws-cli-v2"
version="2.11.15"
url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${version}.zip"
description="Universal Command Line Interface for Amazon Web Services v2"
depends=("groff" "less")
build_depends=("unzip")
replace=("awscli")
repology=("project: awscli")
arch=('amd64')
hash="f07071cab969d83de0f6a049764925acf58a3687c9cec25e153f9a546c637bba"

install() {
  sudo ./install --install-dir "${pkgdir}/usr/local/aws-cli" --bin-dir "/usr/local/bin"

  # bash autocompletion
  echo "complete -C '/usr/local/bin/aws_completer' aws" > "aws-cli_bash_completion"

  sudo install -Dm644 aws-cli_bash_completion "${pkgdir}/etc/bash_completion.d/${pkgname}"
}

removescript() {
  sudo rm -f /usr/local/bin/aws
  sudo rm -f /usr/local/bin/aws_completer
  sudo rm -rf /usr/local/aws-cli/
}
