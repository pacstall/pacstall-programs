#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="dust-bin"
pkgname="dust"
pkgdir="${STOWDIR}/${name}"
version="0.8.0"
description="A more intuitive version of du in rust"
url="https://github.com/bootandy/dust/releases/download/v${version}/dust-v${version}-x86_64-unknown-linux-musl.tar.gz"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="7be13b7c83d0853c1ac4a456d356b762f319955c63b6c0af5be28d44a7ae6cda"

prepare() {
  true
}

build() {
  true
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install binary
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
