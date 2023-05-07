name="dino-git"
url="https://github.com/Henryws/Dino.git"
breaks=("dino" "dino-app" "dino-bin" "dino-deb")
gives="dino"
description="An extensible database system written in Bash"
maintainer="Henryws <hwengerstickel@pm.me>"
pkgver() {
  mkdir tempcount git clone -q --filter=tree:0git clone -q --filter=tree:0 cd tempcount git clone -q --filter=tree:0git clone -q --filter=tree:0 git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master .
}
version="$(pkgver)"

install() {
  sudo install -Dm755 dino "${pkgdir}/usr/bin/dino"
  sudo install -D programs/* -t "${pkgdir}/usr/share/dino/programs"
  sudo install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${name}/LICENSE"
}
