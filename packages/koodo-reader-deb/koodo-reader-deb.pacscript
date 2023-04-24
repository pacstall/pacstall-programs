name="koodo-reader-deb"
gives="koodo-reader"
version="1.5.3"
replace=("${gives}")
case "${CARCH}" in
  amd64)
    url="https://github.com/troyeguo/koodo-reader/releases/download/v${version}/Koodo.Reader-${version}-amd64.deb"
    hash="443991e8250c3c19efad826d8aeb37cfe3183ed8fbd49239cc799c40e5990b42"
    ;;
  arm64)
    url="https://github.com/troyeguo/koodo-reader/releases/download/v${version}/Koodo.Reader-${version}-arm64.deb"
    hash="789f997458408ceb2089db84929805f0fd75b0a2a58d34867fc68b62ec36cc4f"
    ;;
esac
repology=("project: koodo-reader")
arch=('amd64' 'arm64')
description=" A cross-platform ebook reader"
maintainer="সৌম্যদীপ <soumyadeepghosh2004@zohomail.in>"
