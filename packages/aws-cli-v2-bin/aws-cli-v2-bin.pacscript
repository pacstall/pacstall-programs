name="aws-cli-v2-bin"
pkgname="aws-cli-v2"
pkgdir="/usr/src/pacstall/${name}"
version="2.4.17"
url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${version}.zip"
description="Universal Command Line Interface for Amazon Web Services v2"
depends="groff less"
build_depends="unzip"
replace="awscli"
hash="b4a0e6325caa3aee923d45475e73f42eacb8009de2c936ce6659b03a1ec60f40"
maintainer="KwonNam Son <kwon37xi@gmail.com>"

prepare() {
      true
}

build() {
    true
}

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
