name="imwheel-exclude-patched-git"
url="https://github.com/ajh3/imwheel-exclude-patched.git"
build_depends="libx11-dev libxtst-dev libxmu-dev"
depends=""
breaks="imwheel"
description="This project is a fork of imwheel's final official release containing only one change — a patch that repairs imwheel's broken @Exclude command"
pkgver() {
  git ls-remote "${url}" refs/heads/master | cut -f1
}
version="$(pkgver)"

prepare() {
  ./configure --disable-gpm-doc
}

build() {
  make
}

install() {
  sudo make install DESTDIR="$STOWDIR/$name"
  cd "$STOWDIR/$name/usr/local/"
  sudo mkdir -p share
  if [[ -d man ]]; then
    sudo mv man share/
  fi
}
