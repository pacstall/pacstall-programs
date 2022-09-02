#!/usr/bin/bash
#-*- mode: sh-*-
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="just-bin"
pkgname="just"
version="1.4.0"
description="A handy way to save and run project-specific commands"
url="https://github.com/casey/just/releases/download/${version}/just-${version}-x86_64-unknown-linux-musl.tar.gz"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="006a30ceb69f9c93e2dc1d8bac3845395ef5ddb4e6eead762a8cf29e68f6e2a4"
repology=("project: ${pkgname}")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install the binary
  sudo install -Dm755 "just" "${pkgdir}/usr/bin/${pkgname}"

  # Install the license
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install the manpage
  sudo install -Dm644 "just.1" "${pkgdir}/usr/share/man/man1/just.1"

  # Install the docs
  sudo install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  sudo install -Dm644 "GRAMMAR.md" "${pkgdir}/usr/share/doc/${pkgname}/GRAMMER.md"

  # Install the completions
  sudo mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  sudo mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  sudo mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  ./just --completions zsh | sudo tee "${pkgdir}/usr/share/zsh/site-functions/_just" >/dev/null
  ./just --completions bash | sudo tee "${pkgdir}/usr/share/bash-completion/completions/just" >/dev/null
  ./just --completions fish | sudo tee "${pkgdir}/usr/share/fish/vendor_completions.d/just.fish" >/dev/null
}

removescript() {
  # Remove leftover directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
