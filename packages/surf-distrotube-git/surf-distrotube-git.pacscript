pkgname="surf-distrotube-git"
gives="surf"
source=("https://gitlab.com/dwt1/surf-distrotube.git")
arch=("any")
pkgver="0.0.1"
makedepends=("libc6" "libgcr-3-dev" "libglib2.0-dev" "libgtk-3-dev" "libwebkit2gtk-4.0-dev" "libx11-6")
pacdeps=("dmenu")
breaks=("${gives}")
replaces=("${gives}")
pkgdesc="Heavily-patched customized build of the Suckless surf web browser."
sha256sums=("88a73c57558d0d30752184f517d0b6930133ab506383efd394b60d9a04e6513f")

build() {
  cd "surf-distrotube"
  make -j"${NCPU}"
}

package() {
  cd "surf-distrotube"
  make install DESTDIR="${pkgdir}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"
}
