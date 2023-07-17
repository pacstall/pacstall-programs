name="docker-bin"
gives="docker"
replace=("${gives}" "containerd.io")
repology=("project: ${gives}")
version="24.0.1"
depends=("procps" "git" "iptables")
description="Docker Engine Static Binaries"
maintainer="Oren Klopfer <oren@taumoda.com>"

if [[ ${CARCH} == arm64 ]]; then
  url="https://download.docker.com/linux/static/stable/aarch64/${gives}-${version}.tgz"
  hash="7856c7ab0bc5f324391a2922781bbda503bcfbdea1d71eb2b8d871ffc7f8b468"
  arch=('arm64')
else
  url="https://download.docker.com/linux/static/stable/x86_64/${gives}-${version}.tgz"
  hash="298da71767e61b5b9bd40dda26e926d439106eab92df2cf66df6265d4046e3cf"
  arch=('amd64')
fi

build() {
  sudo mkdir -p "${pkgdir}/usr/bin"
}

package() {
  sudo cp -r "../${gives}"/* -t "${pkgdir}/usr/bin"
}
