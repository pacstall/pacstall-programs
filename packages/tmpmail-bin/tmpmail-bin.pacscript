#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="tmpmail-bin"
pkgname="tmpmail"
version="1.2.3"
description="A temporary email right from your terminal written in POSIX sh"
url="https://github.com/sdushantha/tmpmail/archive/refs/tags/v${version}.tar.gz"
depends="w3m curl jq"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="8d12f5474b89ee585413ec32cc9991a971a00e8bb63ac8e5a2e736f734f37cfb"
repology=("project: ${pkgname}")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${STOWDIR}/${name}/usr/share/licenses/${pkgname}"

  # Install man page
  sudo install -Dm644 "tmpmail.1" -t "${STOWDIR}/${name}/usr/share/man/man1"

  # Install README
  sudo install -Dm644 "README.md" -t "${STOWDIR}/${name}/usr/share/doc/${pkgname}"

  # Install binary
  sudo install -Dm755 "tmpmail" -t "${STOWDIR}/${name}/usr/bin"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
