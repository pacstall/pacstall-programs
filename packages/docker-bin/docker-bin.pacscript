name="docker-bin"
gives="docker"
replace=("${gives}")
repology=("project: ${gives}")
version="23.0.3"
depends=("procps" "git" "iptables")
description="Docker Engine Static Binaries"
maintainer="oklopfer <oren@taumoda.com>"

if [[ ${CARCH} == arm64 ]]; then
  url="https://download.docker.com/linux/static/stable/aarch64/${gives}-${version}.tgz"
  hash="2f291f561b6534ace74a357bd02676d6015ab83835c65b909f8a9422fa675a1d"
  arch=('arm64')
else
  url="https://download.docker.com/linux/static/stable/x86_64/${gives}-${version}.tgz"
  hash="34b88116ab30c33daa1c780e9be3232bfa092af575edd3436f12c719fb2e44bf"
  arch=('amd64')
fi

build() {
  sudo mkdir -p "${pkgdir}/usr/bin"
}

install() {
  sudo cp -r "../${gives}"/* -t "${pkgdir}/usr/bin"
}
