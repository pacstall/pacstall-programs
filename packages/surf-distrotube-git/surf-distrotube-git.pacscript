name="surf-distrotube-git"
pkgname="surf"
url="https://gitlab.com/dwt1/surf-distrotube.git"
build_depends=("make")
depends=("libc6" "libgcr-3-dev" "libglib2.0-dev" "libgtk-3-dev" "libwebkit2gtk-4.0-dev" "libx11-6")
pacdeps=("dmenu")
gives="${pkgname}"
breaks=("${pkgname}")
replace=("${pkgname}")
description="Heavily-patched customized build of the Suckless surf web browser."
hash="88a73c57558d0d30752184f517d0b6930133ab506383efd394b60d9a04e6513f"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
