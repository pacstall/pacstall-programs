pkgname="prettier"
pkgver="3.2.5"
pkgdesc="An opinionated code formatter"
homepage='https://prettier.io'
depends=("nodejs")
source=("https://registry.npmjs.org/prettier/-/prettier-${pkgver}.tgz")
sha256sums=("a9d68ae56e5b0fea5c9d8e68b67104dae8445db21e1d24fb3522f3f4c0fb271d")
repology=("project: ${pkgname}")
maintainer=("vigress8 <vig@disroot.org>")

package() {
  cd "${_archive}"
  local mod_dir="usr/lib/node_modules/${pkgname}"
  sudo install -d "${pkgdir}/"{usr/bin,"${mod_dir}"}
  sudo cp -a ./* "${pkgdir}/${mod_dir}"
  sudo chmod 755 "${pkgdir}/${mod_dir}/bin/${pkgname}.cjs"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sudo ln -s "/${mod_dir}/bin/${pkgname}.cjs" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 :et
