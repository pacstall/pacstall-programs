name="bpytop-git"
pkgname="bpytop"
url="https://github.com/aristocratos/${pkgname}.git"
build_depends=("make" "python3" "python3-pip" "python3-distutils")
depends=("python3" "python3-pip" "python3-distutils")
description="Linux/OSX/FreeBSD resource monitor."
hash="9ee4aff7dd84b5475401793b925530c3cfad15c9bb3b4b73c9e875daf919d66c"
release="$(lsb_release -cs)"
modern=("devel" "sid" "lunar" "bookworm" "mantic")

if [[ " ${modern[*]} " =~ " ${release} " ]]; then
  pyhack="--break-system-packages"
else
  pyhack=""
fi

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

prepare() {
  sudo pip3 install --upgrade psutil ${pyhack}
}

install() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
