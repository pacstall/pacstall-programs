name="prettier"
pkgver="3.2.4"
pkgdesc="An opinionated code formatter"
homepage='https://prettier.io'
depends=("nodejs")
url="https://registry.npmjs.org/prettier/-/prettier-${pkgver}.tgz"
hash="753dffcd98f5b1e384bde219f710edb554e43d05ccfb8fe14ed3938d99adac4b"
repology=("project: ${name}")
maintainer="vigress8 <vig@disroot.org>"
mod_dir="usr/lib/node_modules/${name}"

package() {
  sudo install -d "${pkgdir}/"{usr/bin,usr/share/licenses/"${name}","${mod_dir}"}
  sudo cp -ar ./* "${pkgdir}/${mod_dir}"
  sudo chmod 755 "${pkgdir}/${mod_dir}/bin/${name}.cjs"
}

post_install() {
  sudo ln -sf "/${mod_dir}/bin/${name}.cjs" "/usr/bin/${name}"
  sudo ln -sf "/${mod_dir}/LICENSE" "/usr/share/licenses/${name}/LICENSE"
}

post_remove() {
  sudo rm -rf "/usr/"{bin,share/licenses}"/${name}"
}
