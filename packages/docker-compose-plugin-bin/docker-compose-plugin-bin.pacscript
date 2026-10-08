pkgname="docker-compose-plugin-bin"
gives="docker-compose-plugin"
replaces=("${gives}")
pkgver="5.2.0"
pkgdesc="Docker Compose cli plugin"
url='https://github.com/docker/compose'
arch=('amd64' 'arm64')
repology=("project: docker-compose")
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums_amd64=("018f9612ecabc5f2d7aaa53d6f5f44453a87611e2d72c8ef84d7b1eca070e719")
sha256sums_arm64=("739de570a0adf5eab12830db980f549fb5f44ad6b266e1e43e20f6f9df7cbcca")
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
