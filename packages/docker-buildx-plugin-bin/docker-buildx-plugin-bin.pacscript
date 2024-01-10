name="docker-buildx-plugin-bin"
gives="docker-buildx-plugin"
replace=("${gives}")
pkgver="0.12.0"
pkgdesc="Docker Buildx cli plugin"
homepage='https://github.com/docker/buildx'
url="https://github.com/docker/buildx/releases/download/v${pkgver}/buildx-v${pkgver}.linux-${CARCH}"
arch=('amd64' 'arm64')
repology=("project: docker-buildx")
maintainer="Oren Klopfer <oren@taumoda.com>"
if [[ ${CARCH} == "arm64" ]]; then
  hash="781caebb36551b035cb9dcfaf91088543d09c73c4a2549341e6417d86b8bbb50"
else
  hash="7c393b92c148a0ce26c76a2abc99960be1d1097f0471978d41dc51d0c1a4471e"
fi

package() {
  sudo mkdir -p "${pkgdir}/usr/libexec/docker/cli-plugins"
  sudo chmod a+x buildx-v${pkgver}.linux-${CARCH}
  sudo mv ./buildx-v${pkgver}.linux-${CARCH} "${pkgdir}/usr/libexec/docker/cli-plugins/docker-buildx"
}
