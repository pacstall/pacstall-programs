name="obs-backgroundremoval-git"
pkgname="obs-backgroundremoval"
url="https://github.com/royshil/obs-backgroundremoval.git"
build_depends=("libobs-dev" "libsimde-dev" "ninja-build")
pacdeps=("onnxruntime-gpu-bin" "cmake-deb")
breaks=("${pkgname}")
replace=("${pkgname}")
gives=("${pkgname}")
arch=('amd64')
description="OBS plugin to replace the background in portrait images and video"
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
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
