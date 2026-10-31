pkgname="bun-bin"
gives="bun"
pkgver="1.4.4"
arch=("amd64" "arm64")
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
pkgdesc="Incredibly fast JavaScript and TypeScript runtime, bundler, test runner, and package manager"
url="https://bun.sh"
license=("MIT")
repology=("project: bun")
breaks=("${gives}")
replaces=("${gives}")
depends=("unzip")

source_amd64=("https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha256sums_amd64=("bf8ccbfb2b0b80159e0f9a6d15c55317add8077534dbc6130a3edb52fccb395c")

source_arm64=("https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip")
sha256sums_arm64=("baa6bb36f51d6e58561e02bbea825038a9df454f673d6d776e8bbf86f8c7850e")

package() {
  case "${CARCH}" in
    amd64)
      _bindir="${srcdir}/bun-linux-x64"
      ;;
    arm64)
      _bindir="${srcdir}/bun-linux-aarch64"
      ;;
    *)
      return 1
      ;;
  esac

  install -Dm755 "${_bindir}/bun" "${pkgdir}/usr/bin/bun"
  ln -sf "/usr/bin/bun" "${pkgdir}/usr/bin/bunx"
}
