#!/bin/env bash
#-*- mode: sh ;mode:lsp;-*-
pkgname="pacget-git"
gives="pacget"
maintainer=("Erik Lundstedt <erik@lundstedt.it>")
source=("https://gitlab.com/Erik.Lundstedt/pacget.git")
arch=("any")
pkgver="0.0.1"
license="Don't Be a Jerk"
depends=("fzf" "curl" "bash")
pkgdesc="A fully foss, lightweight fuzzysearching TUI frontend for pacstall using fzf"

## installation steps
#this just copies the files over and makes the file executable
package() {
  cd "pacget"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
  install -Dm755 "pacget" "${pkgdir}/usr/bin/pacget"
}

# vim:set ft=sh ts=4 sw=4 noet:
