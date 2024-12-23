pkgname="docker-compose-plugin-bin"
gives="docker-compose-plugin"
replaces=("${gives}")
pkgver="2.30.3"
pkgdesc="Docker Compose cli plugin"
url='https://github.com/docker/compose'
arch=('amd64' 'arm64')
repology=("project: docker-compose")
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums_amd64=("fbb4853d3f2148b0f2f0916f8971c9e500784e4e4949324934fc0b7dc2ed5016")
sha256sums_arm64=("8fed7b79b8bd1cb0624142f7d723c3cc67ba747c77ed69abbdefdc77a6d416d1")
source_amd64=("https://github.com/docker/compose/releases/download/v${pkgver}/docker-compose-linux-x86_64")
source_arm64=("https://github.com/docker/compose/releases/download/v${pkgver}/docker-compose-linux-aarch64")

package() {
  if [[ ${CARCH} == amd64 ]]; then
    gnuarch="x86_64"
  else
    gnuarch="aarch64"
  fi
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/libexec/docker/cli-plugins"
  chmod a+x ./"docker-compose-linux-${gnuarch}"
  mv ./"docker-compose-linux-${gnuarch}" "${pkgdir}/usr/libexec/docker/cli-plugins/docker-compose"
}
