pkgname="rambox-deb"
gives="rambox"
pkgver="2.3.4"
arch=('amd64')
url='https://rambox.app'
repology=("project: rambox")
depends=(
  "libgtk-3-0" "libnotify4" "libnss3" "libxss1" "libxtst6" "xdg-utils"
  "libatspi2.0-0" "libuuid1" "libsecret-1-0"
)
optdepends=(
  "libappindicator3-1: AppIndicator/SysTray Support"
)
sha256sums=("2fc00888e9dcc6baed57032b2d14d0e9fbff67dd3cd47162106e95e6b8d4fd7d")
source=("https://github.com/ramboxapp/download/releases/download/v${pkgver}/Rambox-${pkgver}-linux-x64.deb")
replaces=("${pkgname}" "${gives}")
conflicts=("${replaces[@]}")
pkgdesc="Workspace simplifier"
maintainer=("Eric Renfro <psi-jack@linux-help.org>")

# vim:set ft=sh ts=2 sw=2 et:
