name="prettier"
pkgver="3.1.1"
pkgdesc="An opinionated code formatter"
homepage="https://prettier.io"
depends=("nodejs")
url="https://registry.npmjs.org/prettier/-/prettier-${pkgver}.tgz"
hash="9f0e0d855654470f15dc68a78ebe6861e921eb326c0522ffec54d06e71009274"
maintainer="vigress8 <vig@disroot.org>"

package() {
    local mod_dir="usr/lib/node_modules/${name}"
    sudo install -d "${pkgdir}/"{usr/bin,usr/share/licenses/"${name}","${mod_dir}"}
    sudo cp -ar ./* "${pkgdir}/${mod_dir}"
    sudo ln -sf "${mod_dir}/bin/${name}.cjs" "${pkgdir}/usr/bin/${name}"
    sudo ln -sf "${mod_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${name}/LICENSE"
}
