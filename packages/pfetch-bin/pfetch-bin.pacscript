name="pfetch-bin"
gives="pfetch"
version="0.6.0"
url="https://github.com/dylanaraps/${gives}/archive/refs/tags/${version}.zip"
build_depends=""
depends=""
breaks="${pkgname} ${pkgname}-bin ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
description="A lightweight and simple fetch tool"
hash="ec85100a912c0bdd06a82a9647d19a5c6d1d51c3a262d60b9ac8f17570fbfb39"
prepare() {
	true
}

build() {
	true
}

install() {
	sudo install -Dm755 $name -t  "$STOWDIR/$name/usr/bin"
}
