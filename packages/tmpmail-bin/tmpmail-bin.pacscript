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
version="1.2.1"
description="A temporary email right from your terminal written in POSIX sh"
url="https://github.com/sdushantha/tmpmail/archive/refs/tags/v${version}.tar.gz"
depends="w3m curl jq"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="f886c2fcb548ae5f0c3e928b91a0761c64da332dbe34289d6820e0cb034ca2fb"
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
