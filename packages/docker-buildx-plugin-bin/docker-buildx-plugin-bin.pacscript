pkgname="docker-buildx-plugin-bin"
gives="docker-buildx-plugin"
replaces=("${gives}")
pkgver="0.35.0"
pkgdesc="Docker Buildx cli plugin"
url='https://github.com/docker/buildx'
source=("https://github.com/docker/buildx/releases/download/v${pkgver}/buildx-v${pkgver}.linux-${CARCH}")
arch=('amd64' 'arm64')
repology=("project: docker-buildx")
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums_amd64=("d41ece72044243b4f58b343441ae37446d9c29a7d6b5e11c61847bbcf8f7dfda")
sha256sums_arm64=("c4248d6cbc4a619a7e0b4609c11e509ad4ac0b475e1c64817c0ac20c5d90c766")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/libexec/docker/cli-plugins"
  chmod a+x ./"buildx-v${pkgver}.linux-${CARCH}"
  mv ./"buildx-v${pkgver}.linux-${CARCH}" "${pkgdir}/usr/libexec/docker/cli-plugins/docker-buildx"
}
