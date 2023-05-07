name="rhino-neofetch-git"
url="https://github.com/oklopfer/neofetch-rhino.git"
gives="rhino-neofetch"
provides=('neofetch')
replace=("neofetch")
description="neofetch branded for Rhino Linux"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

install() {
  sudo DESTDIR="${pkgdir}" make install
}
