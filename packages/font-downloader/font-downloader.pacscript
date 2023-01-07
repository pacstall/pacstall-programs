name="font-downloader"
gives="font-downloader"
version="10.0.0"
build_depends="meson libhandy-1-dev gettext"
# HACK: https://github.com/pacstall/pacstall/issues/727
depends="python3-gi libhandy-1-dev"
url="https://github.com/GustavoPeredo/Font-Downloader/archive/refs/tags/v${version}.zip"
repology=("project: fontdownloader")
description="Install fonts from online sources"
hash="eeafd4ac9cb0d47fd0c1512e07805d0f7a639cdbbc688647249eaee8d1753e23"
maintainer="সৌম্যদীপ <soumyadeepghosh2004@zohomail.in>"

build() {
  meson --prefix=/usr build
  ninja -C build
}
install() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}
