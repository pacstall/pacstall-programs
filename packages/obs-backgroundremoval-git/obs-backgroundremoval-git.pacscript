name="obs-backgroundremoval-git"
pkgname="obs-backgroundremoval"
url="https://github.com/royshil/obs-backgroundremoval.git"
build_depends=("libobs-dev" "wget" "git" "build-essential" "libsimde-dev" "ninja-build")
pacdeps=("onnxruntime-bin" "cmake-deb")
breaks=("${pkgname}")
arch=('amd64')
description="This plugin is meant to make it easy to replace the background in portrait images and video. It is using a neural network to predict the mask of the portrait and remove the background pixels. It's easily composable with other OBS plugins to replace the background with e.g. an image or a transparent color."
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  git ls-remote "${url}" refs/heads/main | cut -f1 | cut -c1-8
}
version="$(pkgver)"
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
