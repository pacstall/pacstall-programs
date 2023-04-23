name="kirc"
repology=("project: ${name}")
version="0.3.2"
url="https://github.com/mcpcpc/${name}/archive/refs/tags/${version}.tar.gz"
build_depends=("automake")
breaks=("${name}-git")
replace="${name}"
description="A tiny IRC client written in POSIX C99"
hash="a45172198873fb34c64150262be4515a7be268a5c00566c79f03a8ea2dd7900e"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
