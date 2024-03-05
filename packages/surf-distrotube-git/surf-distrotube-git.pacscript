name="surf-distrotube-git"
pkgname="surf"
source=("https://gitlab.com/dwt1/surf-distrotube.git")
pkgver="0.0.1"
makedepends=("libc6" "libgcr-3-dev" "libglib2.0-dev" "libgtk-3-dev" "libwebkit2gtk-4.0-dev" "libx11-6")
pacdeps=("dmenu")
gives="${pkgname}"
breaks=("${pkgname}")
replaces=("${pkgname}")
pkgdesc="Heavily-patched customized build of the Suckless surf web browser."
hash=("88a73c57558d0d30752184f517d0b6930133ab506383efd394b60d9a04e6513f")

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
