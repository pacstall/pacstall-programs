name="clib"
version="2.8.1"
description="C package manager-ish"
url="https://github.com/clibs/${name}/archive/refs/tags/${version}.tar.gz"
depends="gcc libcurl4-gnutls-dev"
hash="0d2330e3c46ce21d7fa3d29f0f99b9527eb5ab323b1efb9b1a0e6915779c74d6"
pkgdir="/usr/src/pacstall/${name}"
repology=("project: ${name}")

prepare()  {
  true
}
build() {
  make -j"${nproc}"
}

install() {
  sudo  make install DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr/local/"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${name}"
}
