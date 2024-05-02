pkgname="docker-compose-plugin-bin"
gives="docker-compose-plugin"
replaces=("${gives}")
pkgver="2.24.7"
pkgdesc="Docker Compose cli plugin"
homepage='https://github.com/docker/compose'
arch=('amd64' 'arm64')
repology=("project: docker-compose")
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums_amd64=("19c9deb6f4d3915f5c93441b8d2da751a09af82df62d55eab097c2cbfebd519f")
sha256sums_arm64=("86fa6982c55e1bb741ac71ebbbb78c715224eeb46a820364ec6075cf87047d53")
if [[ ${CARCH} == amd64 ]]; then
  gnuarch="x86_64"
else
  gnuarch="aarch64"
fi
source=("https://github.com/docker/compose/releases/download/v${pkgver}/docker-compose-linux-${gnuarch}")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/libexec/docker/cli-plugins"
  chmod a+x ./"docker-compose-linux-${gnuarch}"
  mv ./"docker-compose-linux-${gnuarch}" "${pkgdir}/usr/libexec/docker/cli-plugins/docker-compose"
}
