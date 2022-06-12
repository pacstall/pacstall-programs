name="distrobox"
version="1.3.1"
description="Use any linux distribution inside your terminal"
repology=("project: distrobox")
url="https://github.com/89luca89/distrobox/archive/refs/tags/${version}.tar.gz"
hash="22b6625ca243f55c08630d37015cdbfbe1939516022bfef502aa6603f42b4d00"
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
