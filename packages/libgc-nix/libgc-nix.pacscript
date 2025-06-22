pkgname='libgc-nix'
arch=("any")
pkgver='8.2.6'
pkgdesc='The Boehm-Demers-Weiser conservative C/C++ Garbage Collector (patched for Nix)'
url='https://www.hboehm.info/gc/'
provides=('libgc1' 'libgc-dev')
replaces=("${provides[@]}")
repology=('project: boehm-gc')
makedepends=('pkg-config')
patchrev='7dfa2a761ef8856454d8f63eda27edb8984bdc98'
source=(
  "https://github.com/ivmai/bdwgc/releases/download/v${pkgver}/gc-${pkgver}.tar.gz"
  "https://github.com/lix-project/lix/raw/${patchrev}/boehmgc-coroutine-sp-fallback.diff"
)
sha256sums=(
  'b9183fe49d4c44c7327992f626f8eaa1d8b14de140f243edb1c9dcff7719a7fc'
  'ddf3d3948262ae023e30491f6db437506e421633739a0e81da7f68f0a454fb13'
)

prepare() {
  patch -d "gc-${pkgver}" -sp1 < boehmgc-coroutine-sp-fallback.diff
}

build() {
  cd "gc-${pkgver}"
  ./configure --prefix=/usr --enable-cplusplus --disable-static
  make -j"${NCPU}"
}

check() {
  make -C "gc-${pkgver}" check
}

package() {
  make -C "gc-${pkgver}" install DESTDIR="${pkgdir}"
}
