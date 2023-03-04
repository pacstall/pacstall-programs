name="obs-backgroundremoval-git"
pkgname="obs-backgroundremoval"
url="https://github.com/royshil/obs-backgroundremoval.git"
build_depends="libobs-dev libopencv-dev wget git build-essential cmake"
# install required dependency for codename > focal
codename=$(lsb_release -cs)
case ${codename} in
  focal) ;;
  *)
    build_depends="${build_depends} libsimde-dev"
    ;;
esac
pacdeps="onnxruntime-1-7-0-bin"
breaks="${pkgname}"
description="This plugin is meant to make it easy to replace the background in portrait images and video. It is using a neural network to predict the mask of the portrait and remove the background pixels. It's easily composable with other OBS plugins to replace the background with e.g. an image or a transparent color."
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  # temporarily use latest buildable commit
  #git ls-remote "${url}" refs/heads/main | cut -f1 | cut -c1-8
  echo bedcaf97
}
version="$(pkgver)"

prepare() {
  # temporarily use latest buildable commit
  git fetch --depth=10
  git checkout "${version}"
  # fix CMakeLists
  versionC="$(git ls-remote -t "${url}" | cut -f2 | cut -d/ -f3 | cut -dv -f2 | cut -d- -f1 | tail -n1)"
  sed -i "s/^version_from_git()/set(VERSION ${versionC})/" CMakeLists.txt
  sed -i "s;LIBDIR}/obs-plugin;LIBDIR}/x86_64-linux-gnu/obs-plugin;" CMakeLists.txt
}

build() {
  mkdir build && cd build || exit
  cmake -DobsIncludePath=/usr/include/obs -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}"/usr .. > /dev/null && cmake --build . -j"$(nproc)" > /dev/null
}

install() {
  cd build || exit
  sudo cmake --install . > /dev/null
  sudo install -Dm644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"
}
