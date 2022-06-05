name="distrobox"
version="1.3.0"
description="se any linux distribution inside your terminal."
repology=("project: distrobox")
url="https://github.com/89luca89/distrobox/archive/refs/tags/${version}.tar.gz"
hash="03c0ba2115c14a178ad3ecc63f2103cf55c15ba42bc43978394ba00ad40da80b"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"

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
    ./install -P "${STOWDIR}/${name}/usr"
}
