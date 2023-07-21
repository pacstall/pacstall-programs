name="docker-bin"
gives="docker"
replace=("${gives}-desktop" "${gives}-ce" "${gives}-ce-cli" "containerd.io")
repology=("project: ${gives}")
version="24.0.4"
depends=("procps" "git" "iptables")
description="Docker Engine Static Binaries"
maintainer="Oren Klopfer <oren@taumoda.com>"

if [[ ${CARCH} == arm64 ]]; then
  url="https://download.docker.com/linux/static/stable/aarch64/${gives}-${version}.tgz"
  hash="193a8e1f051adce6a30a4c8486ce9b39929b9633a0da8c96444c9239859f4354"
  arch=('arm64')
else
  url="https://download.docker.com/linux/static/stable/x86_64/${gives}-${version}.tgz"
  hash="0ab79ae5f19e2ef5bdc3c3009c8b770dea6189e0f1e0ef4935d78fd30519b11d"
  arch=('amd64')
fi

build() {
  sudo mkdir -p "${pkgdir}/usr/bin"
}

package() {
  sudo cp -r "../${gives}"/* -t "${pkgdir}/usr/bin"
}
