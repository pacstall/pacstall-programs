name="github-cli-git"
pkgname="github-cli"
gives="gh"
build_depends="build-essential"
breaks="${pkgname}-git ${pkgname}-bin"
replace="${gives}"
repology=("project: ${pkgname}")
url="https://github.com/cli/cli.git"
description="GitHub’s official command line tool - Git version"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
pacdeps=("go-bin")

pkgver() {
        git ls-remote "${url}" trunk | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
        true
}

build() {
        make -j"$(nproc)"
}

install() {
        sudo make install DESTDIR="${STOWDIR}/${name}"
}
