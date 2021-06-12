#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="hyperfine-bin"
pkgname="hyperfine"
pkgdir="/usr/src/pacstall/${name}"
version="1.11.0"
description="A command-line benchmarking tool"
url="https://github.com/sharkdp/${pkgname}/releases/download/v${version}/${pkgname}-v${version}-x86_64-unknown-linux-musl.tar.gz"
breaks="${pkgname}-git"
hash="0e7a109e99fe34e9dde0f86597fe0a59bc756cb280d0e191d30acdd1226f70c1"
removescript="yes"

prepare() {
  true
}

build() {
  true
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  sudo install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install binary
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  # Install completions
  sudo install -Dm644 "autocomplete/${pkgname}.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  sudo install -Dm644 "autocomplete/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  sudo install -Dm644 "autocomplete/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  # Install man page
  sudo install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  sudo gzip --best "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

removescript() {
  rm -rf "/usr/share/licenses/hyperfine"
  rm -rf "/usr/share/doc/hyperfine"
}
