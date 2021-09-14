#!/bin/env bash
#-*- mode: sh ;mode:lsp;-*-
name="pacget-git"
pkgname="pacget"
pkgdir="/usr/src/pacstall/${name}"

maintainer="Erik Lundstedt <erik@lundstedt.it>"
url="https://gitlab.com/Erik.Lundstedt/pacget.git"

license="Don't Be a Jerk"
depends="fzf curl bash"
gives="$pkgname"
description="A fully foss, lightweight fuzzysearching TUI frontend for pacstall using fzf"
removescript="yes"

debian="TRUE"
ubuntu="TRUE"

pkgver() {
	git ls-remote "${url}" main | cut -f1
}
version="$(pkgver)"

## installation steps
#preparations
prepare() {
	true
}
# pacget is a bashscript, no need to build anything
build() {
    true
}
#this just copies the files over and makes the file executable
install() {
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "pacget" "/usr/src/$name/pacget/usr/bin/pacget"

}

removescript() {
	rm -rf /usr/src/pacstall/pacget
	rm -rf "/usr/share/licenses/${pkgname}"
}
