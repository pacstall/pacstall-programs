pkgname="docker-compose-plugin-bin"
gives="docker-compose-plugin"
replaces=("${gives}")
pkgver="2.33.0"
pkgdesc="Docker Compose cli plugin"
url='https://github.com/docker/compose'
arch=('amd64' 'arm64')
repology=("project: docker-compose")
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums_amd64=("6395dbb256db6ea28d5c6695bc9bc33866c07ad1c93792f8d85857f1c21c34ee")
sha256sums_arm64=("03a42a0fc0614ffc3c9ebca521cab75e02c427b68e45e3f6867d9510b9a28818")
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
