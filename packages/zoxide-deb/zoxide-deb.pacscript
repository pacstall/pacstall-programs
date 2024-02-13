name="zoxide-deb"
gives="zoxide"
pkgdesc="A smarter cd command. Supports all major shells."
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: zoxide")
arch=("amd64" "arm64")
pkgver="0.9.3"
url="https://github.com/ajeetdsouza/zoxide/releases/download/v${pkgver}/zoxide_${pkgver}-1_${CARCH}.deb"

case "${CARCH}" in
  amd64)
    hash="3c4a2b249338cd5d5e1b932f86293a8326fcd72752bf2ede76c4b513a3601c5e"
    ;;
  arm64)
    hash="bddf6acca08d20b4abc8eeaf2cd0598cc86e1f3fa5084867a2e37b208cc698c6"
    ;;
  *) return 1 ;;
esac
