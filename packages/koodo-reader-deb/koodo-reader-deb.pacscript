pkgname="koodo-reader-deb"
gives="koodo-reader"
pkgver="1.5.3"
replaces=("${gives}")
source_amd64=("https://github.com/troyeguo/koodo-reader/releases/download/v${pkgver}/Koodo.Reader-${pkgver}-amd64.deb")
sha256sums_amd64=("443991e8250c3c19efad826d8aeb37cfe3183ed8fbd49239cc799c40e5990b42")
source_arm64=("https://github.com/troyeguo/koodo-reader/releases/download/v${pkgver}/Koodo.Reader-${pkgver}-arm64.deb")
sha256sums_arm64=("789f997458408ceb2089db84929805f0fd75b0a2a58d34867fc68b62ec36cc4f")

repology=("project: koodo-reader")
arch=('amd64' 'arm64')
pkgdesc=" A cross-platform ebook reader"
maintainer=("সৌম্যদীপ <soumyadeepghosh2004@zohomail.in>")
