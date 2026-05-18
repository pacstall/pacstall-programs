pkgname="docker-buildx-plugin-bin"
gives="docker-buildx-plugin"
replaces=("${gives}")
pkgver="0.33.0"
pkgdesc="Docker Buildx cli plugin"
url='https://github.com/docker/buildx'
source=("https://github.com/docker/buildx/releases/download/v${pkgver}/buildx-v${pkgver}.linux-${CARCH}")
arch=('amd64' 'arm64')
repology=("project: docker-buildx")
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums_amd64=("9426a15411f35f635afef3f5d3bae53155c3e30d26dee430cc968e13d34be49f")
sha256sums_arm64=("204dc28447d3bb48f42ed1ce5747e0885cd57e306506a39029311becdb1ef786")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/libexec/docker/cli-plugins"
  chmod a+x ./"buildx-v${pkgver}.linux-${CARCH}"
  mv ./"buildx-v${pkgver}.linux-${CARCH}" "${pkgdir}/usr/libexec/docker/cli-plugins/docker-buildx"
}
