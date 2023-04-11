name="nomachine-deb"
gives="nomachine"
repology=("project: ${gives}")
version="8.4.2_5"
breaks="${gives}-bin ${gives}-app ${gives}-git"
replace="${gives}"
url="https://download.nomachine.com/download/8/Linux/${gives}_${version}_${CARCH}.deb"
description="Remote desktop software designed for anyone who wants to access a single or multiple computers."
case "${CARCH}" in
  amd64)
    hash="da75df8f6521a5947addb5204aba377876381657da811383349011acbe1140ca"
    arch=('amd64')
    ;;
  arm64)
    hash="da76b029a1865c2d987e4f55ba2484d8cc0597285ec346a4d88664a834772d95"
    arch=('arm64')
    ;;
esac
maintainer="Cameron Computer <cameron.computer@pm.me>"
