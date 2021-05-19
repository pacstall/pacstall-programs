#-*- mode: sh ;mode:lsp;mode: minimap  -*-
name="pacget"
pkgname="$name"
version=1.0
maintainer="Erik Lundstedt <erik@lundstedt.it>"
url="https://gitlab.com/Erik.Lundstedt/pacget.git"
license="Don't Be a Jerk"
depends="fzf curl bash"
gives="$name"
description="A fully foss, lightweight fuzzysearching TUI frontend for pacstall using fzf"
debian=TRUE
ubuntu=TRUE
## installation stepps
#preparations
prepare() 
{
	sudo mkdir -p "/usr/src/pacstall/$name"
	sudo mkdir -p "/usr/src/pacstall/$name/tmp/pacget"
	sudo mkdir -p "/usr/src/pacstall/$name/usr/bin"
}
# pacget is a bashscript, no need to build anything
build() 
{
true
}
#this just coppies the files over and makes the file executable
install() 
{
	sudo cp -p pacget /usr/src/pacstall/pacget/bin/pacget
	sudo chmod 755 /usr/src/pacstall/pacget/bin/pacget/
}

