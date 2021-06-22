#!/bin/env bash
#-*- mode: sh ;mode:lsp;-*-
name="pacget-git"
pkgname="pacget"
pkgdir="/usr/src/pacstall/${name}"

maintainer="Erik Lundstedt <erik@lundstedt.it>"
url="https://gitlab.com/Erik.Lundstedt/pacget.git"

license="Don't Be a Jerk"
depends="fzf curl bash"
description="A fully foss, lightweight fuzzysearching TUI frontend for pacstall using fzf"
removescript="yes"

debian=TRUE
ubuntu=TRUE

pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

## installation stepps
#preparations
prepare() {
	sudo mkdir -p "/usr/src/$name/$pkgname"
	sudo mkdir -p "/usr/src/$name/$pkgname/tmp/pacget"
	sudo mkdir -p "/usr/src/$name/$pkgname/usr/bin"
}
# pacget is a bashscript, no need to build anything
build() {
    true
}
#this just coppies the files over and makes the file executable
install() {
	sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	sudo install -Dm755 "pacget" "/usr/src/$name/pacget/usr/bin/pacget"
}

removescript() {
	sudo rm -rf "/usr/share/licenses/${pkgname}"
}
