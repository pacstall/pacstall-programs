name="distrobox"
version="1.4.1"
description="Use any linux distribution inside your terminal"
repology=("project: distrobox")
url="https://github.com/89luca89/distrobox/archive/refs/tags/${version}.tar.gz"
hash="be3266f77011b30da5d0035e246d4e4a9360b7c90fbd8b90ac581165a00217b8"
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
