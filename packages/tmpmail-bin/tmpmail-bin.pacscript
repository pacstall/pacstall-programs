#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="tmpmail-bin"
pkgname="tmpmail"
pkgdir="${STOWDIR}/${name}"
version="1.2.0"
description="A temporary email right from your terminal written in POSIX sh"
url="https://github.com/sdushantha/tmpmail/archive/refs/tags/v${version}.tar.gz"
depends="w3m curl jq"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="2f943f8923afb91e66fa48ffe5e70ef8af84a067d69d4e2f543c0fd8b6c759ea"
repology=("project: tmpmail")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install man page
  sudo install -Dm644 "tmpmail.1" -t "${pkgdir}/usr/share/man/man1"

  # Install README
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install binary
  sudo install -Dm755 "tmpmail" -t "${pkgdir}/usr/bin"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
