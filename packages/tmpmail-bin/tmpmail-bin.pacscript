#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="tmpmail-bin"
pkgname="tmpmail"
pkgver="1.2.3"
pkgdesc="A temporary email right from your terminal written in POSIX sh"
url="https://github.com/sdushantha/tmpmail/archive/refs/tags/v${pkgver}.tar.gz"
depends=("w3m" "curl" "jq")
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="8d12f5474b89ee585413ec32cc9991a971a00e8bb63ac8e5a2e736f734f37cfb"
repology=("project: ${pkgname}")

package() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install man page
  sudo install -Dm644 "tmpmail.1" -t "${pkgdir}/usr/share/man/man1"

  # Install README
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install binary
  sudo install -Dm755 "tmpmail" -t "${pkgdir}/usr/bin"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
