name="font-downloader"
gives="font-downloader"
version="10.0.0"
build_depends="cmake meson ninja-build libhandy-1-dev"
# HACK: https://github.com/pacstall/pacstall/issues/727
depends="libgtk-4-dev libgstreamer1.0-dev libadwaita-1-dev"
url="https://github.com/GustavoPeredo/Font-Downloader/archive/refs/tags/v${version}.zip"
#repology=("project: ")
description="Install fonts from online sources"
hash="eeafd4ac9cb0d47fd0c1512e07805d0f7a639cdbbc688647249eaee8d1753e23"
maintainer="সৌম্যদীপ <soumyadeepghosh2004@zohomail.in>"

build(){
mkdir build
meson build .
cd build
ninja
}
install(){
sudo ninja install
}
