name="uwufetch"
pkgname="uwufetch"
version="1.4"
url="https://github.com/TheDarkBug/uwufetch/archive/refs/tags/1.4.zip"
description="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
build_depends="gcc pandoc"
optdepends="viu lshw"
gives="uwufetch"
breaks="uwufetch-git uwufetch-bin"
hash="062de9ec1af10ce5bccc5cd99ab72511883076c96d6ebb6f21647fb3486ca391"

prepare() {
  sudo mkdir -p /usr/src/pacstall/uwufetch/usr/bin
  sudo mkdir -p /usr/src/pacstall/uwufetch/usr/lib
  sudo mkdir -p /usr/src/pacstall/uwufetch/usr/share/man/man1
}

build() {
  make -j$(nproc) build DESTDIR=/usr/src/pacstall/uwufetch
  make -j$(nproc) man DESTDIR=/usr/src/pacstall/uwufetch
}

install() {
  sudo make install DESTDIR=/usr/src/pacstall/uwufetch
}
