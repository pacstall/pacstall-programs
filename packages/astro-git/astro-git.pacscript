name="astro-git"
pkgname="astro"
url="https://github.com/blmayer/astro.git"
depends="sh less"
description="A Gemini web browser using shell script"
#hash="" #WIP
#maintainer=""
removescript="yes"
pkgver() {
	git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
	true
}

build() {
	true
}

install() {
	sudo make install PREFIX=/usr/src/pacstall/$name
	sudo install -Dm644 LICENSE /usr/src/pacstall/$name/usr/share/licenses/$pkgname
}

removescript() {
	sudo rm -rf /usr/share/licenses/$pkgname
	sudo rm -rf /usr/src/pacstall/$name
} 
