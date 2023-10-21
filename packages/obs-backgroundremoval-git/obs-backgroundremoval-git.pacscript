name="obs-backgroundremoval-git"
pkgname="obs-backgroundremoval"
url="https://github.com/royshil/obs-backgroundremoval.git"
pkgver="1.1.3"
makedepends=("libobs-dev" "libcurl4-openssl-dev" "libssl-dev" "qt6-base-dev" "libgl1-mesa-dev" "ninja-build")
pacdeps=("cmake-deb")
breaks=("${pkgname}")
replace=("${pkgname}")
gives=("${pkgname}")
arch=('amd64')
pkgdesc="OBS plugin to replace the background in portrait images and video"
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  git ls-remote "${url}" refs/heads/main | cut -f1 | cut -c1-8
}
incompatible=('ubuntu:focal' 'ubuntu:bionic' 'debian:buster' 'debian:bullseye')

build() {
  cmake --preset linux-x86_64 -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build_x86_64 --parallel
}

package() {
  sudo cmake --install build_x86_64 --prefix "${pkgdir}"/usr
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}
