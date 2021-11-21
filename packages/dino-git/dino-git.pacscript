name="dino-git"
url="https://github.com/Henryws/Dino.git"
breaks="dino"
description="An extensible database system written in Bash"
maintainer="Henryws <hwengerstickel@pm.me>"

pkgver() {
  git ls-remote "${url}" master | cut -f1
}

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -dm755 dino /usr/src/pacstall/dino-git/bin/dino
  sudo install -dm755 programs/* /usr/src/pacstall/dino-git/usr/share/dino/programs
}
