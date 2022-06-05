name="distrobox"
version="1.3.0"
description="Use any linux distribution inside your terminal"
repology=("project: distrobox")
url="https://github.com/89luca89/distrobox/archive/refs/tags/${version}.tar.gz"
hash="03c0ba2115c14a178ad3ecc63f2103cf55c15ba42bc43978394ba00ad40da80b"
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
