name="koodo-reader-deb"
gives="koodo-reader"
pkgver="1.5.3"
replace=("${gives}")
case "${CARCH}" in
  amd64)
    url="https://github.com/troyeguo/koodo-reader/releases/download/v${pkgver}/Koodo.Reader-${pkgver}-amd64.deb"
    hash="443991e8250c3c19efad826d8aeb37cfe3183ed8fbd49239cc799c40e5990b42"
    ;;
  arm64)
    url="https://github.com/troyeguo/koodo-reader/releases/download/v${pkgver}/Koodo.Reader-${pkgver}-arm64.deb"
    hash="789f997458408ceb2089db84929805f0fd75b0a2a58d34867fc68b62ec36cc4f"
    ;;
  *) return 1 ;;
esac
repology=("project: koodo-reader")
arch=('amd64' 'arm64')
pkgdesc=" A cross-platform ebook reader"
maintainer="সৌম্যদীপ <soumyadeepghosh2004@zohomail.in>"
