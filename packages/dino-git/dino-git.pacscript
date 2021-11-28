name="dino-git"
url="https://github.com/Henryws/Dino.git"
breaks="dino dino-app dino-bin dino-deb"
gives="dino"
description="An extensible database system written in Bash"
maintainer="Henryws <hwengerstickel@pm.me>"

pkgver() {
  git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 dino /usr/src/pacstall/dino-git/usr/bin/dino
  sudo install -D programs/* -t /usr/src/pacstall/dino-git/usr/share/dino/programs
  sudo install -Dm755 LICENSE /usr/src/pacstall/dino-git/usr/share/licenses/"${name}"/LICENSE
}
