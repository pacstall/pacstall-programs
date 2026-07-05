pkgname="nutext-bin"
gives="nutext"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="0.6.2"
url='https://github.com/rhino-linux/nu_plugin_nutext'
source_amd64=("${url}/releases/download/${pkgver}/${gives}_${pkgver}_amd64.zip")
source_arm64=("${url}/releases/download/${pkgver}/${gives}_${pkgver}_arm64.zip")
sha256sums_amd64=("75377b65ba4486f450abd1fe5b8841b335f15fd1363d0020da8978dad20cc6d3")
sha256sums_arm64=("dc21912d064c95a9c4ea50015de0370f09d7242eae6877bedbca1fb7056935e9")
pkgdesc="Another translaton plugin for nushell"
maintainer=("Elsie19 <elsie19@pm.me>")
pacdeps=("nushell-bin")
replaces=("${gives}-git")

package() {
  cp -r "usr" "${pkgdir}"
}
