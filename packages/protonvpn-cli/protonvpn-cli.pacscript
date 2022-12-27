name="protonvpn-cli"
breaks="${name}-git"
replace="${name}"
repology=("project: ${name}")
version="3.13.0"
url="https://github.com/ProtonVPN/linux-cli/archive/refs/tags/${version}.tar.gz"
build_depends="python3-setuptools"
depends="python3-dialog"
pacdeps=("protonvpn-nm-lib" "proton-python-client")
description="Official ProtonVPN Linux app (CLI)"
hash="d295d6c899638a88d615e2cacb078ecf2aee8c771ebb087c9edb43aea25aacd9"
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
