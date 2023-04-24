name="proton-python-client"
breaks="${name}-git ${name}-bin"
replace=("${name}")
repology=("project: ${name}")
version="0.7.1"
url="https://github.com/ProtonMail/${name}/archive/refs/tags/${version}.tar.gz"
build_depends=("python3-requests" "python3-setuptools" "python3-bcrypt" "python3-gnupg" "python3-openssl")
description="Python Proton client module"
hash="88d2546a922d9053988b5e1863bf6cf965e97b4c643cd879f16bb3f0b5f02b5e"

install() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1
}
