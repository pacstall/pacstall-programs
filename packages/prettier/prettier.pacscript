name="prettier"
pkgver="3.1.1"
pkgdesc="An opinionated code formatter"
homepage='https://prettier.io'
depends=("nodejs")
url="https://registry.npmjs.org/prettier/-/prettier-${pkgver}.tgz"
hash="fb6213d29bcc213b8a996c612be41d5891f18545edb73589ea6d6fce2055d4b6"
repology=("project: ${name}")
maintainer="vigress8 <vig@disroot.org>"

package() {
    local mod_dir="usr/lib/node_modules/${name}"
    sudo install -d "${pkgdir}/"{usr/bin,usr/share/licenses/"${name}","${mod_dir}"}
    sudo cp -ar ./* "${pkgdir}/${mod_dir}"
}

post_install() {
    sudo ln -sf "/${mod_dir}/bin/${name}.cjs" "/usr/bin/${name}"
    sudo ln -sf "/${mod_dir}/LICENSE" "/usr/share/licenses/${name}/LICENSE"
}

post_remove() {
    sudo rm -rf "/usr/"{bin,share/licenses}"/${name}"
}
