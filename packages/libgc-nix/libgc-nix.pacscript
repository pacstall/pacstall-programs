pkgname='libgc-nix'
arch=('any')
pkgver='8.2.8'
epoch=1
pkgdesc='The Boehm-Demers-Weiser conservative C/C++ Garbage Collector (patched for Nix)'
url='https://www.hboehm.info/gc/'
provides=("libgc1=${epoch}:${pkgver}" "libgc-dev=${epoch}:${pkgver}")
replaces=("${provides[@]}")
maintainer=('vigress8 <vig@disroot.org>')
repology=('project: boehm-gc')
makedepends=('pkg-config')
patchrev='cc54a7243aa4b7bf87afc351885e1b9e42b32202'
source=(
  "https://github.com/ivmai/bdwgc/releases/download/v${pkgver}/gc-${pkgver}.tar.gz"
  "https://github.com/NixOS/nixpkgs/raw/${patchrev}/pkgs/tools/package-management/nix/patches/boehmgc-coroutine-sp-fallback.patch"
)
sha256sums=(
  '7649020621cb26325e1fb5c8742590d92fb48ce5c259b502faf7d9fb5dabb160'
  'ddf3d3948262ae023e30491f6db437506e421633739a0e81da7f68f0a454fb13'
)

prepare() {
  patch -d "gc-${pkgver}" -sp1 < boehmgc-coroutine-sp-fallback.patch
}

build() {
  cd "gc-${pkgver}"
  ./configure \
    --disable-static \
    --enable-cplusplus \
    --enable-large-config \
    --prefix=/usr
  make -j"${NCPU}"
}

check() {
  make -C "gc-${pkgver}" check
}

package() {
  make -C "gc-${pkgver}" install DESTDIR="${pkgdir}"
}
