name="nu-tongues-bin"
gives="nu-tongues"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="0.1.0"
homepage="https://github.com/rhino-linux/${gives}"
url="https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip"
pkgdesc="A translaton plugin for nushell. Allows nushell scripts to set up commands to get translated strings."
case "${CARCH}" in
  amd64)
    hash="5163f5f9cb7871636f7c4636865e49672b382dc6154de95c461d9492fadf4575"
    ;;
  arm64)
    hash="aa3efbcf529e00ced0967dc8531aa54c98e57a717de330f0fe2485d500ffefd3"
    ;;
  *) return 1 ;;
esac
maintainer="wren54 <osmium.otter@gmail.com>"
pacdeps=("nushell-bin")

package() {
  sudo install -Dm0555 "nu_plugin_${gives}" -t "${pkgdir}/usr/local/bin"
}

post_install() {
  nu -c "register /usr/local/bin/nu_plugin_${gives}"
}