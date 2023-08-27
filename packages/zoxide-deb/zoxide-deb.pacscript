name="zoxide-deb"
gives="zoxide"
pkgdesc="A smarter cd command. Supports all major shells."
maintainer="lfromanini <lfromanini@yahoo.com>"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="0.9.2"

case "${CARCH}" in
  amd64)
    url="https://github.com/ajeetdsouza/zoxide/releases/download/v${pkgver}/zoxide_${pkgver}_amd64.deb"
    hash="a50c0073270aa3118c8505e1e6c4deec385cef61a25d1916d7c2ad7ba9df8839"
    ;;
  arm64)
    url="https://github.com/ajeetdsouza/zoxide/releases/download/v${pkgver}/zoxide_${pkgver}_arm64.deb"
    hash="3b763f2b341fc9eacf68564fc47b9c866988f3d850d3fa9e12eb026cbbc219cf"
    ;;
  *) return 1 ;;
esac
