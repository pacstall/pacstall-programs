name="brave-browser-nightly-deb"
pkgver="1.65.49"
gives="brave-browser-nightly"
breaks=("${gives}-bin" "${gives}-app" "${gives}-git")
replace=("${gives}")
pacdeps=("brave-keyring-deb")
url="https://github.com/brave/brave-browser/releases/download/v${pkgver}/${gives}_${pkgver}_amd64.deb"
homepage='https://brave.com/'
pkgdesc="The Brave browser is a fast, private and secure web browser for PC, Mac and mobile - Nightly channel"
hash="87b93d5964f1dc9e5439a808918d3ca6599314a4ad42106e75925e19a865f3f4"
arch=('amd64')
repology=("project: brave" "visiblename: brave-nightly-bin")
maintainer="Elsie19 <elsie19@pm.me>"
