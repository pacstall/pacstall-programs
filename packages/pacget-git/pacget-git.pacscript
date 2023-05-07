#!/bin/env bash
#-*- mode: sh ;mode:lsp;-*-
name="pacget-git"
pkgname="pacget"
maintainer="Erik Lundstedt <erik@lundstedt.it>"
url="https://gitlab.com/Erik.Lundstedt/pacget.git"
license="Don't Be a Jerk"
depends=("fzf" "curl" "bash")
description="A fully foss, lightweight fuzzysearching TUI frontend for pacstall using fzf"
debian="TRUE"
ubuntu="TRUE"

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

## installation steps
#this just copies the files over and makes the file executable
install() {
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  sudo install -Dm755 "pacget" "${pkgdir}/usr/bin/pacget"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
}
# vim:set ft=sh ts=4 sw=4 noet:
