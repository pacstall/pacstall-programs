name="github-cli-bin"
pkgname="github-cli"
gives="gh"
breaks="${gives}-git ${gives}-deb"
replace="${gives}"
repology=("project: ${gives}")
version="2.14.2"
url="https://github.com/cli/cli/releases/download/v${version}/${gives}_${version}_linux_amd64.tar.gz"
description="GitHub's official command line tool - Binary version"
hash="2b7abf662810adfb094cf16ef95b1b0064e6ce7fa903808dd1acd9a4fe8cdabc"
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
