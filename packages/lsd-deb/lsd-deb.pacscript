name="lsd-deb"
gives="lsd"
repology=("project: ${gives}")
pkgver="1.0.0"
pkgdesc="The next gen ls command"
arch=("amd64" "arm64" "i386")
url="https://github.com/${gives}-rs/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
case "${CARCH}" in
  amd64)
    hash="488b098e9cc4bb193c10d3a9abe8b06282099ee73a3e9f7f1febd19a9d9b89f0"
    ;;
  arm64)
    hash="4a0e6931823869b401a7ef3dae26e3c027aaee3c42bd62129ee2c6a93489412d"
    ;;
  i386)
    url=$(sed -r 's|i386|i686|g' <<< "${url}")
    hash="3a9d7193f90cce0884edb6f1c2230ec5cf942fd122e75691fc32cf3e8f728dcb"
    ;;
  *) return 1 ;;
esac
