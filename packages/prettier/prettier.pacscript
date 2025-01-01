pkgname="prettier"
arch=("all")
pkgver="3.3.3"
pkgdesc="An opinionated code formatter"
url='https://prettier.io'
depends=("nodejs")
source=("@${pkgname}~${pkgver}::https://registry.npmjs.org/prettier/-/prettier-${pkgver}.tgz")
sha256sums=("2f1ecb0ab57a588e0d4d40d3d45239e71ebd8f0190199d0d3f87fe2283639f46")
repology=("project: ${pkgname}")
maintainer=()

package() {
  cd "${pkgname}~${pkgver}"
  local mod_dir="usr/lib/node_modules/${pkgname}"
  install -d "${pkgdir}/"{usr/bin,"${mod_dir}"}
  cp -a ./* "${pkgdir}/${mod_dir}"
  chmod 755 "${pkgdir}/${mod_dir}/bin/${pkgname}.cjs"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sf "/${mod_dir}/bin/${pkgname}.cjs" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 :et
