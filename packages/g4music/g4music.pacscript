name="g4music"
gives="g4music"
version="1.8.2"
build_depends="meson valac libgtk-4-dev libgstreamer1.0-dev libadwaita-1-dev"
#This is a temporary fix, because pacstall doesn't install run-time deps before installation
depends="libgtk-4-dev libgstreamer1.0-dev libadwaita-1-dev"
url="https://gitlab.gnome.org/neithern/g4music/-/archive/v${version}/g4music-v${version}.zip"
repology=("project: g4music")
description="Play your music in an elegant way"
hash="b4463737257f7985a48ce17a56b5a27a9a3ebfc02cf0f78b6725e03ca984dafe"
maintainer="সৌম্যদীপ <soumyadeepghosh2004@zohomail.in>"
build(){
	meson setup build --buildtype=release
}
install(){
	sudo meson install -C build --destdir=${pkgdir}
}
