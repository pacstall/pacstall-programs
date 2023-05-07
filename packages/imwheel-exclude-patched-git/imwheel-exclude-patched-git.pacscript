name="imwheel-exclude-patched-git"
url="https://github.com/ajh3/imwheel-exclude-patched.git"
build_depends=("libx11-dev" "libxtst-dev" "libxmu-dev")
breaks=("imwheel")
description="This project is a fork of imwheel's final official release containing only one change — a patch that repairs imwheel's broken @Exclude command"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

prepare() {
  ./configure --disable-gpm-doc
}

build() {
  make
}

install() {
  sudo make install DESTDIR="${pkgdir}"
  cd "${pkgdir}/usr/local/"
  sudo mkdir -p share
  if [[ -d man ]]; then
    sudo mv man share/
  fi
}
