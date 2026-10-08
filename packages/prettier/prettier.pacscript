pkgname="prettier"
arch=("all")
pkgver="3.9.5"
pkgdesc="An opinionated code formatter"
url='https://prettier.io'
depends=("nodejs")
source=("@${pkgname}~${pkgver}::https://registry.npmjs.org/prettier/-/prettier-${pkgver}.tgz")
sha256sums=("e9525d1e389f8ab0543fef69d3af87a999db99dcb02a73dc9aeb93e3c48aebbe")
repology=("project: ${pkgname}")

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
