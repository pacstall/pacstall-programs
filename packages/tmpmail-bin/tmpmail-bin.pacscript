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
version="1.1.9"
description="A temporary email right from your terminal written in POSIX sh"
url="https://github.com/sdushantha/tmpmail/archive/refs/tags/v${version}.tar.gz"
depends="w3m curl jq"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="05c7c7baf3af75b15a198db3a33f0ba4606514a5d0603013c76e34bb767bdad3"

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
