name="prettier"
pkgver="3.2.5"
pkgdesc="An opinionated code formatter"
homepage='https://prettier.io'
depends=("nodejs")
url="https://registry.npmjs.org/prettier/-/prettier-${pkgver}.tgz"
hash="a9d68ae56e5b0fea5c9d8e68b67104dae8445db21e1d24fb3522f3f4c0fb271d"
repology=("project: ${name}")
maintainer="vigress8 <vig@disroot.org>"

package() {
  local mod_dir="usr/lib/node_modules/${name}"
  sudo install -d "${pkgdir}/"{usr/bin,"${mod_dir}"}
  sudo cp -a ./* "${pkgdir}/${mod_dir}"
  sudo chmod 755 "${pkgdir}/${mod_dir}/bin/${name}.cjs"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
  sudo ln -sf "/${mod_dir}/bin/${name}.cjs" "${pkgdir}/usr/bin/${name}"
}

# vim:set ft=sh ts=2 sw=2 :et
