name="github-cli-bin"
pkgname="github-cli"
gives="gh"
breaks="${gives}-git ${gives}-deb"
replace="${gives}"
repology=("project: ${pkgname}")
version="2.21.1"
url="https://github.com/cli/cli/releases/download/v${version}/${gives}_${version}_linux_amd64.tar.gz"
description="GitHub's official command line tool - Binary version"
hash="0c0ab559721d2ff05df9d64fcdaca4f8f0b76d177832379116bd5c4d032fea88"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    true
}

install() {
    # Binary
    sudo mkdir -p "${STOWDIR}/${name}/usr/bin"
    sudo mv "./bin/gh" "${STOWDIR}/${name}/usr/bin"
    # Man
    sudo mkdir -p "${STOWDIR}/${name}/usr/share/man/man1"
    sudo mv "./share/man/man1" "${STOWDIR}/${name}/usr/share/man"
}

# vim:set ft=sh ts=2 sw=2 et:
