pkgname="docker-compose-plugin-bin"
gives="docker-compose-plugin"
replaces=("${gives}")
pkgver="2.35.1"
pkgdesc="Docker Compose cli plugin"
url='https://github.com/docker/compose'
arch=('amd64' 'arm64')
repology=("project: docker-compose")
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums_amd64=("7bdb2ce2916e5dd0354e5d129892bf96fdcdb1a9ab8eed69b9173e131db4c230")
sha256sums_arm64=("a91e930a076b91e6c69f11d1dbe3c06729ae765fb9dbb3f97cb808e784647399")
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
