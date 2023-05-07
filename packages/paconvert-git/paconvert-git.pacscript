name="paconvert-git"
gives="paconvert"
breaks=("${gives}-deb" "${gives}-bin" "${gives}-app" "${gives}-git")
url="https://github.com/pacstall/paconvert.git"
description="Paconvert makes converting PKGBUILDS into pacscripts easier."
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

prepare() {
  sudo mkdir -p "${pkgdir}/usr/bin"
}

install() {
  sudo install -Dm755 ./paconvert "${pkgdir}/usr/bin/paconvert"
}
