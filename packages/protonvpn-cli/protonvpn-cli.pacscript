name="protonvpn-cli"
breaks="${name}-git"
replace="${name}"
repology=("project: ${name}")
version="3.11.1"
url="https://github.com/ProtonVPN/linux-cli/archive/refs/tags/${version}.tar.gz"
depends="python3-dialog"
pacdeps=("protonvpn-nm-lib")
description="Official ProtonVPN Linux app (CLI)"
hash="6abc3d28a9506d0654f68447e222d038b44313ee4120cc3fa936ff4c02128641"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo python3 setup.py install --root="${STOWDIR}/${name}" --optimize=1
}
