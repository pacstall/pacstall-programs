pkgname="nu-tongues-bin"
gives="nu-tongues"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="0.1.0"
url="https://github.com/rhino-linux/${gives}"
source=("@${pkgname}~${pkgver}::https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip")
pkgdesc="A translaton plugin for nushell. Allows nushell scripts to set up commands to get translated strings."
sha256sums_amd64=("8fa03893368db208cf6fe1e65264e4d4374f5bb6b4b09b4dde5df31a85eaf34f")
sha256sums_arm64=("29d3a06c6188b66738dcbecc9efaf2ce0708e17243e298adcd5710aac2a356e8")

maintainer=("wren54 <osmium.otter@gmail.com>")
pacdeps=("nushell-bin")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm0555 "nu_plugin_${gives}" -t "${pkgdir}/usr/local/bin"
}

post_install() {
  if ! [[ -d "${homedir}/.config/nushell" ]]; then
    mkdir -p "${homedir}/.config/nushell"
    sudo chown -cR "${PACSTALL_USER}" "${homedir}/.config/nushell"
  fi
  nu -c "register /usr/local/bin/nu_plugin_${gives}"
}
