pkgname="obs-backgroundremoval-0-4-0"
pkgver="0.4.0"
source=("https://codeload.github.com/royshil/obs-backgroundremoval/tar.gz/refs/tags/v${pkgver}")
makedepends=("libobs-dev" "libopencv-dev" "cmake")
# install required dependency for codename > focal
codename="$(lsb_release -cs)"
case "${codename}" in
  focal) ;;
  *)
    makedepends+=("libsimde-dev")
    ;;
esac
pacdeps=("onnxruntime-1-7-0-bin")
breaks="${pkgname}-git"
pkgdesc="OBS plugin to replace the background in portrait images and video"
sha256sums=("e88bbc902154b5efd46d8fc1dee52fcf079c8ff2ae6593d9f716017fdd1ef601")
arch=('amd64')
maintainer=("Zahrun <Zahrun@github.com>")

prepare() {
  cd "${_archive}"
  # fix CMakeLists
  sed -i "s/^version_from_git()/set(VERSION ${pkgver})/" CMakeLists.txt
  sed -i "s;LIBDIR}/obs-plugin;LIBDIR}/x86_64-linux-gnu/obs-plugin;" CMakeLists.txt
  # fix plugin crashes OBS
  sed -i "s/std::string(newModel);/newModel;/" src/background-filter.cpp
}

build() {
  cd "${_archive}"
  mkdir build && cd build || exit
  cmake -DobsIncludePath=/usr/include/obs -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}"/usr .. > /dev/null && cmake --build . -j"${NCPU}" > /dev/null
}

package() {
  cd "${_archive}"
  cd build || exit
  cmake --install . > /dev/null
  install -Dm644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
