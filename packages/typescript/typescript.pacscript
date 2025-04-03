_name=TypeScript
pkgname=typescript
pkgver=5.8.2
pkgrel=1
pkgdesc='JavaScript with syntax for types'
arch=(any)
url=http://www.typescriptlang.org
license=(Apache-2.0)
depends=(nodejs)
makedepends=(
  git
  npm
  rsync
)
source=("git+https://github.com/microsoft/${_name}.git#tag=v${pkgver}")
b2sums=('4dca488b389c44058ff7745427817b1f60f41e2fe11363d88f9a14685d3667ea5ee18b7517a2e066c402cc97ff019f422a4176cdbb93600a0f465d9cb874ecbc')
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
