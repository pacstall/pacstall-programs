pkgname="docker-buildx-plugin-bin"
gives="docker-buildx-plugin"
replaces=("${gives}")
pkgver="0.14.0"
pkgdesc="Docker Buildx cli plugin"
url='https://github.com/docker/buildx'
source=("https://github.com/docker/buildx/releases/download/v${pkgver}/buildx-v${pkgver}.linux-${CARCH}")
arch=('amd64' 'arm64')
repology=("project: docker-buildx")
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums_amd64=("32f8f17eca35bf2efe6c0e47f40e4692a876f34531b421efc984799a5b41226e")
sha256sums_arm64=("38bf0ea9c48743edb8243f14272be65a2bad7092228068337aea584309ea664c")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/libexec/docker/cli-plugins"
  chmod a+x ./"buildx-v${pkgver}.linux-${CARCH}"
  mv ./"buildx-v${pkgver}.linux-${CARCH}" "${pkgdir}/usr/libexec/docker/cli-plugins/docker-buildx"
}
