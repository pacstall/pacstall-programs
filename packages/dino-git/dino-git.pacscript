name="dino-git"
url="https://github.com/Henryws/Dino.git"
breaks=("dino" "dino-app" "dino-bin" "dino-deb")
gives="dino"
description="An extensible database system written in Bash"
maintainer="Henryws <hwengerstickel@pm.me>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

install() {
  sudo install -Dm755 dino "${pkgdir}/usr/bin/dino"
  sudo install -D programs/* -t "${pkgdir}/usr/share/dino/programs"
  sudo install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${name}/LICENSE"
}
