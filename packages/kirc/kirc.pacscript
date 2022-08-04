name="kirc"
repology=("project: ${name}")
version="0.3.1"
url="https://github.com/mcpcpc/${name}/archive/refs/tags/${version}.tar.gz"
build_depends="automake"
breaks="${name}-git"
replace="${name}"
description="A tiny IRC client written in POSIX C99"
hash="19bb058a9845eb5b2febe6e8d658dcd06c194b58669f37837dbdf37627c7d7dd"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    make -j"$(nproc)"
}

install() {
    sudo make install DESTDIR="${STOWDIR}/${name}"
}
