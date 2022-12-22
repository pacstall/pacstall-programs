name="aws-cli-v2-bin"
pkgname="aws-cli-v2"
version="2.9.9"
url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${version}.zip"
description="Universal Command Line Interface for Amazon Web Services v2"
depends="groff less"
build_depends="unzip"
replace="awscli"
repology=("project: awscli")
hash="3385b944e0275e5d644e4eca2819f875614f8819021435b0cc4e4335ef02cde7"
maintainer="Marie Piontek <marie@kaifa.ch>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo ./install --install-dir "${STOWDIR}/${name}/usr/local/aws-cli" --bin-dir "/usr/local/bin"

  # bash autocompletion
  echo "complete -C '/usr/local/bin/aws_completer' aws" > "aws-cli_bash_completion"

  sudo install -Dm644 aws-cli_bash_completion "${STOWDIR}/${name}/etc/bash_completion.d/${pkgname}"
}

removescript() {
  sudo rm -f /usr/local/bin/aws
  sudo rm -f /usr/local/bin/aws_completer
}
