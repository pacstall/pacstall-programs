
name="aws-cli-v2-bin"
pkgname="aws-cli-v2"
pkgdir="/usr/src/pacstall/${name}"
version="2.2.35"
url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${version}.zip"
description="Universal Command Line Interface for Amazon Web Services v2"
build_depends="unzip"
replace="awscli"
hash="bfdd14ffaa5237a90949ca24a1f8556fa54a47db893546e83b6a45925c9c1be3"
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

removescript(){
    sudo rm -f /usr/local/bin/aws
    sudo rm -f /usr/local/bin/aws_completer
}
