name="protonvpn-cli"
breaks="${name}-git"
replace="${name}"
repology=("project: ${name}")
version="3.12.0"
url="https://github.com/ProtonVPN/linux-cli/archive/refs/tags/${version}.tar.gz"
depends="python3-dialog"
pacdeps=("protonvpn-nm-lib" "proton-python-client")
description="Official ProtonVPN Linux app (CLI)"
hash="761d8c1864b46e0caea5cea19e1be5dc46940fbcc294c8923a2a34ff4b1ee2bf"
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
