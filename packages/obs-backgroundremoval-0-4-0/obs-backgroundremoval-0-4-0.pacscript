name="obs-backgroundremoval-0-4-0"
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
breaks="${name}-git"
pkgdesc="OBS plugin to replace the background in portrait images and video"
hash=("e88bbc902154b5efd46d8fc1dee52fcf079c8ff2ae6593d9f716017fdd1ef601")
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"

prepare() {
  # fix CMakeLists
  sed -i "s/^version_from_git()/set(VERSION ${pkgver})/" CMakeLists.txt
  sed -i "s;LIBDIR}/obs-plugin;LIBDIR}/x86_64-linux-gnu/obs-plugin;" CMakeLists.txt
  # fix plugin crashes OBS
  sed -i "s/std::string(newModel);/newModel;/" src/background-filter.cpp
}

build() {
  mkdir build && cd build || exit
  cmake -DobsIncludePath=/usr/include/obs -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}"/usr .. > /dev/null && cmake --build . -j"${NCPU}" > /dev/null
}

package() {
  cd build || exit
  sudo cmake --install . > /dev/null
  sudo install -Dm644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"
}
