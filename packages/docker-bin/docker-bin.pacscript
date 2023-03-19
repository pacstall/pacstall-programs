name="docker-bin"
gives="docker"
replace="${gives}"
repology=("project: ${gives}")
version="23.0.1"
depends="procps git iptables"
description="Docker Engine Static Binaries"

if [ $(dpkg --print-architecture) = arm64 ]; then
  url="https://download.docker.com/linux/static/stable/aarch64/${gives}-${version}.tgz"
  hash="3865f837dbd951b19eeb5f7d87aada2e865b2017e9462fe389f0e5d9a438324d"
  arch=('arm64');
else
  url="https://download.docker.com/linux/static/stable/x86_64/${gives}-${version}.tgz"
  hash="ec8a71e79125d3ca76f7cc295f35eea225f4450e0ffe0775f103e2952ff580f6"
  arch=('amd64'); 
fi

install() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}

postinst() {
  sudo dockerd
}