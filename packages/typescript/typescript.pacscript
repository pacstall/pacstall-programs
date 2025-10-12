_name="TypeScript"
pkgname="typescript"
pkgver="5.8.3"
pkgdesc='JavaScript with syntax for types'
arch=("any")
url='https://www.typescriptlang.org'
license=("Apache-2.0")
depends=("nodejs")
makedepends=(
  "git"
  "npm"
  "rsync"
)
source=("git+https://github.com/microsoft/${_name}.git#tag=v${pkgver}")
b2sums=('SKIP')
external_connection=true
maintainer=("Bahar KURT <kurtbahartr@gmail.com>")

prepare() {
  cd "${_name}"
  npm ci
}

build() {
  cd "${_name}"
  npx hereby LKG
}

check() {
  cd "${_name}"
  npm run test
}

package() {
  local mod_dir=/usr/lib/node_modules/"${pkgname}"

  install -d "${pkgdir}"/{usr/bin,"${mod_dir}"}
  ln -s "${mod_dir}"/bin/{tsc,tsserver} "${pkgdir}"/usr/bin

  cd "${_name}"
  rsync -r --exclude=.gitattributes bin lib package.json "${pkgdir}"/"${mod_dir}"
  install -Dm644 -t "${pkgdir}"/usr/share/doc/"${pkgname}" README.md SECURITY.md
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/"${pkgname}" \
    ThirdPartyNoticeText.txt
}
