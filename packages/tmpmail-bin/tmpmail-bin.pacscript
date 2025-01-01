#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="tmpmail-bin"
gives="tmpmail"
arch=("amd64")
pkgver="1.2.3"
pkgdesc="A temporary email right from your terminal written in POSIX sh"
source=("@${pkgname}~${pkgver}::https://github.com/sdushantha/tmpmail/archive/refs/tags/v${pkgver}.tar.gz")
depends=("w3m" "curl" "jq")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("8d12f5474b89ee585413ec32cc9991a971a00e8bb63ac8e5a2e736f734f37cfb")
repology=("project: ${gives}")

package() {
  cd "${pkgname}~${pkgver}"
  # Install license
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"

  # Install man page
  install -Dm644 "tmpmail.1" -t "${pkgdir}/usr/share/man/man1"

  # Install README
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"

  # Install binary
  install -Dm755 "tmpmail" -t "${pkgdir}/usr/bin"
}

# vim:set ft=sh ts=2 sw=2 et:
