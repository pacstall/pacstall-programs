name="aws-cli-v2-bin"
pkgname="aws-cli-v2"
version="2.7.16"
url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${version}.zip"
description="Universal Command Line Interface for Amazon Web Services v2"
depends="groff less"
build_depends="unzip"
replace="awscli"
hash="00a5e1c917734f0b661fa9933776003bb867665e3185cdf11a1ee24e013d7f63"
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
