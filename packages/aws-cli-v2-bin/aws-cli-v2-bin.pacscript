name="aws-cli-v2-bin"
pkgname="aws-cli-v2"
version="2.7.6"
url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${version}.zip"
description="Universal Command Line Interface for Amazon Web Services v2"
depends="groff less"
build_depends="unzip"
replace="awscli"
hash="61565e678db8b0308827295991adb89d961ecbd1d32b68fd192d707c4ba6aef0"
maintainer="KwonNam Son <kwon37xi@gmail.com>"

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
