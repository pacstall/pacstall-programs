name="distrobox"
version="1.4.2.1"
description="Use any linux distribution inside your terminal"
repology=("project: distrobox")
url="https://github.com/89luca89/distrobox/archive/refs/tags/${version}.tar.gz"
hash="cbe9217315f848396ec1eb8e21929d23065caa6a1a55f8988500475e823b1f31"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${name}"
breaks="${name} ${name}-deb ${name}-app ${name}-git"
optdepends=(
  "docker: enable docker usage"
  "podman: enable podman usage"
)

install() {
  sudo ./install -P "${pkgdir}/usr"
}
