name="surf-distrotube-git"
gives="surf"
url="https://gitlab.com/dwt1/surf-distrotube.git"
pkgver="0.0.1"
makedepends=("libc6" "libgcr-3-dev" "libglib2.0-dev" "libgtk-3-dev" "libwebkit2gtk-4.0-dev" "libx11-6")
pacdeps=("dmenu")
breaks=("${gives}")
replace=("${gives}")
pkgdesc="Heavily-patched customized build of the Suckless surf web browser."
hash="88a73c57558d0d30752184f517d0b6930133ab506383efd394b60d9a04e6513f"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"
}
