name="distrobox"
version="1.4.0"
description="Use any linux distribution inside your terminal"
repology=("project: distrobox")
url="https://github.com/89luca89/distrobox/archive/refs/tags/${version}.tar.gz"
hash="e643a702c3f3f0d7467afe840b4f3ee6e4c369b6464618b6ec09f7ad27eb64f5"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${name}"
breaks="${name} ${name}-deb ${name}-app ${name}-git"
optdepends=(
    "docker: enable docker usage"
    "podman: enable podman usage"
)

prepare() {
    true
}

build() {
    true
}

install() {
    sudo ./install -P "${STOWDIR}/${name}/usr"
}
