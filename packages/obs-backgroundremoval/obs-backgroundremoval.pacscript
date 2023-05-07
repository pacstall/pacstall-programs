name="obs-backgroundremoval"
repology=("project: obs-backgroundremoval")
version="0.5.19"
url="https://codeload.github.com/royshil/obs-backgroundremoval/tar.gz/refs/tags/v${version}"
build_depends=("libobs-dev" "libsimde-dev" "ninja-build")
pacdeps=("onnxruntime-gpu-bin" "cmake-deb")
breaks=("${name}-git")
replace=("${name}")
arch=('amd64')
description="OBS plugin to replace the background in portrait images and video"
hash="97b803df872d75278fe955a2a53c2ed8e1b7792f6794a2a2e639dfae84a08f72"
maintainer="Zahrun <Zahrun@github.com>"

incompatible=('ubuntu:jammy' 'ubuntu:focal' 'ubuntu:bionic' 'debian:buster' 'debian:bullseye')

build() {
  mkdir build && cd build || exit
  cmake -DUSE_SYSTEM_ONNXRUNTIME=ON -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}"/usr .. > /dev/null && cmake --build . -j"$(nproc)" > /dev/null
}

install() {
  cd build || exit
  sudo cmake --install . > /dev/null
  sudo mkdir -p "${pkgdir}"/usr/lib/x86_64-linux-gnu/obs-plugins/
  sudo mkdir -p "${pkgdir}"/usr/share/obs/
  sudo mv "${pkgdir}"/usr/obs-plugins/64bit/* "${pkgdir}"/usr/lib/x86_64-linux-gnu/obs-plugins/
  sudo rm -r "${pkgdir}"/usr/obs-plugins
  sudo mv "${pkgdir}"/usr/data/* "${pkgdir}"/usr/share/obs/
  sudo rm "${pkgdir}"/usr/data -r
  sudo install -Dm644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"
}
