#!/bin/env bash
#-*- mode: sh ;mode:lsp;-*-
name="pacget-git"
pkgname="pacget"
maintainer="Erik Lundstedt <erik@lundstedt.it>"
source=("https://gitlab.com/Erik.Lundstedt/pacget.git")
pkgver="0.0.1"
license="Don't Be a Jerk"
depends=("fzf" "curl" "bash")
pkgdesc="A fully foss, lightweight fuzzysearching TUI frontend for pacstall using fzf"

## installation steps
#this just copies the files over and makes the file executable
package() {
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  sudo install -Dm755 "pacget" "${pkgdir}/usr/bin/pacget"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
}
# vim:set ft=sh ts=4 sw=4 noet:
