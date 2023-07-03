name="dino-git"
url="https://github.com/Elsie19/Dino.git"
breaks=("dino" "dino-app" "dino-bin" "dino-deb")
gives="dino"
description="An extensible database system written in Bash"
maintainer="Elsie19 <hwengerstickel@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

pacakge() {
  sudo install -Dm755 dino "${pkgdir}/usr/bin/dino"
  sudo install -D programs/* -t "${pkgdir}/usr/share/dino/programs"
  sudo install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${name}/LICENSE"
}
