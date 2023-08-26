name="docker-bin"
gives="docker"
replace=("${gives}-desktop" "${gives}-ce" "${gives}-ce-cli" "containerd.io")
repology=("project: ${gives}")
pkgver="24.0.5"
depends=("procps" "git" "iptables")
pkgdesc="Docker Engine Static Binaries"
maintainer="Oren Klopfer <oren@taumoda.com>"
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  gnuarch="aarch64"
  hash="ba911d9ff8a54a7afc8f91e998984f78a704bcb4932134c4dda2c401209a9921"
else
  gnuarch="x86_64"
  hash="0a5f3157ce25532c5c1261a97acf3b25065cfe25940ef491fa01d5bea18ddc86"
fi
url="https://download.docker.com/linux/static/stable/${gnuarch}/${gives}-${pkgver}.tgz"

build() {
  sudo mkdir -p "${pkgdir}/usr/bin"
}

package() {
  sudo cp -r "../${gives}"/* -t "${pkgdir}/usr/bin"
}
