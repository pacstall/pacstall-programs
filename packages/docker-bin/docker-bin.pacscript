name="docker-bin"
gives="docker"
replace=("${gives}-desktop" "${gives}-ce" "${gives}-ce-cli" "containerd.io")
repology=("project: ${gives}")
pkgver="24.0.4"
depends=("procps" "git" "iptables")
pkgdesc="Docker Engine Static Binaries"
maintainer="Oren Klopfer <oren@taumoda.com>"
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  gnuarch="aarch64"
  hash="193a8e1f051adce6a30a4c8486ce9b39929b9633a0da8c96444c9239859f4354"
else
  gnuarch="x86_64"
  hash="0ab79ae5f19e2ef5bdc3c3009c8b770dea6189e0f1e0ef4935d78fd30519b11d"
fi
url="https://download.docker.com/linux/static/stable/${gnuarch}/${gives}-${pkgver}.tgz"

build() {
  sudo mkdir -p "${pkgdir}/usr/bin"
}

package() {
  sudo cp -r "../${gives}"/* -t "${pkgdir}/usr/bin"
}
