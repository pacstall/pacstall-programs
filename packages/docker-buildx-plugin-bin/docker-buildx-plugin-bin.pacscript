pkgname="docker-buildx-plugin-bin"
gives="docker-buildx-plugin"
replaces=("${gives}")
pkgver="0.18.0"
pkgdesc="Docker Buildx cli plugin"
url='https://github.com/docker/buildx'
source=("https://github.com/docker/buildx/releases/download/v${pkgver}/buildx-v${pkgver}.linux-${CARCH}")
arch=('amd64' 'arm64')
repology=("project: docker-buildx")
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums_amd64=("4fe2eb90ac22b27fa03734899fcf814aa1e214a4952b9b30b20d551baf1d9a5c")
sha256sums_arm64=("da9742321bb462547ebde69bf8420ac07b2a2c80fb57260f539bfc9f312becd6")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/libexec/docker/cli-plugins"
  chmod a+x ./"buildx-v${pkgver}.linux-${CARCH}"
  mv ./"buildx-v${pkgver}.linux-${CARCH}" "${pkgdir}/usr/libexec/docker/cli-plugins/docker-buildx"
}
