name="g4music"
gives="g4music"
version="1.8.1"
build_depends="meson valac libgtk-4-dev libgstreamer1.0-dev libadwaita-1-dev"
depends="libgtk-4-dev libgstreamer1.0-dev libadwaita-1-dev"
url="https://gitlab.gnome.org/neithern/g4music/-/archive/v${version}/g4music-v${version}.tar.gz"
repology=("project: g4music")
description="Play your music in an elegant way"
hash=""
maintainer="সৌম্যদীপ <soumyadeepghosh2004@zohomail.in>"
build(){
	meson setup build --buildtype=release
}
install(){
	sudo meson install -C build --destdir=${pkgdir}
}
