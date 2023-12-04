#!/bin/env bash
#-*- mode: sh ;mode:lsp;-*-
name="pacget-git"
gives="pacget"
maintainer="Erik Lundstedt <erik@lundstedt.it>"
url="https://gitlab.com/Erik.Lundstedt/pacget.git"
pkgver="0.0.1"
license="Don't Be a Jerk"
depends=("fzf" "curl" "bash")
pkgdesc="A fully foss, lightweight fuzzysearching TUI frontend for pacstall using fzf"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

## installation steps
#this just copies the files over and makes the file executable
package() {
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
  sudo install -Dm755 "pacget" "${pkgdir}/usr/bin/pacget"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${gives}"
}
# vim:set ft=sh ts=4 sw=4 noet:
