#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="hyperfine-bin"
pkgname="hyperfine"
pkgdir="${STOWDIR}/${name}"
version="1.14.0"
description="A command-line benchmarking tool"
url="https://github.com/sharkdp/${pkgname}/releases/download/v${version}/${pkgname}-v${version}-x86_64-unknown-linux-musl.tar.gz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="9d3c53e7da84b41896d4208b722765742af1169a4dab9788321f8597ea159010"
repology=("project: hyperfine")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE-APACHE" "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install binary
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install completions
  sudo install -Dm644 "autocomplete/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  sudo install -Dm644 "autocomplete/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  sudo install -Dm644 "autocomplete/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  # Install man page
  sudo install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  sudo gzip --best "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
