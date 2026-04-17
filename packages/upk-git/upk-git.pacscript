pkgname="upk-git"
pkgver="1.2.1"
pkgdesc="Ubuntu Package Kit - Universal package manager wrapper"
arch=('any')
url='https://github.com/undefinederror/upk'
maintainer=("undefinederror <github@object.ninja>")
license=('MIT')
depends=('python3' 'python3-click' 'python3-rich')
makedepends=('python3' 'python3-click' 'python3-rich' 'python3-setuptools')
provides=("upk")
conflicts=("upk")
source=("https://github.com/undefinederror/upk.git")

build() {
  cd "upk"
  mkdir -p "completions"
  _UPK_COMPLETE=bash_source python3 -m upk.upk > "completions/upk.bash"
}

package() {
  cd "upk"
  python3 setup.py install --root="${pkgdir}" --install-layout=deb --optimize=1
  install -Dm644 "completions/upk.bash" "${pkgdir}/usr/share/bash-completion/completions/upk"
}
