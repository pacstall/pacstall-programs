name="docker-compose-plugin-bin"
gives="docker-compose-plugin"
replace=("${gives}")
pkgver="2.24.7"
pkgdesc="Docker Compose cli plugin"
homepage='https://github.com/docker/compose'
case ${CARCH} in
  amd64) gnuarch="x86_64" ;;
  arm64) gnuarch="aarch64" ;;
esac
url="https://github.com/docker/compose/releases/download/v${pkgver}/docker-compose-linux-${gnuarch}"
arch=('amd64' 'arm64')
repology=("project: docker-compose")
maintainer="Oren Klopfer <oren@taumoda.com>"
if [[ ${CARCH} == "arm64" ]]; then
  hash="86fa6982c55e1bb741ac71ebbbb78c715224eeb46a820364ec6075cf87047d53"
else
  hash="19c9deb6f4d3915f5c93441b8d2da751a09af82df62d55eab097c2cbfebd519f"
fi

package() {
  sudo mkdir -p "${pkgdir}/usr/libexec/docker/cli-plugins"
  sudo chmod a+x ./"docker-compose-linux-${gnuarch}"
  sudo mv ./"docker-compose-linux-${gnuarch}" "${pkgdir}/usr/libexec/docker/cli-plugins/docker-compose"
}
