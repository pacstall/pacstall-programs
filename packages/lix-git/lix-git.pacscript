pkgname='lix-git'
gives='lix'
pkgver='2.92.0'
pkgdesc='A modern, delicious implementation of the Nix package manager, focused on correctness, usability, and growth'
url='https://lix.systems'
source=('lix::https://github.com/lix-project/lix.git')
maintainer=('vigress8 <vig@disroot.org>')
repology=('project: lix-nix')
conflicts=('lix' 'nix-bin' 'nix-setup-systemd')
external_connection='true'
makedepends_amd64=('libcpuid-dev')
makedepends=(
  'busybox-static'
  'cargo'
  'cmake'
  'doxygen'
  'graphviz'
  'libarchive-dev'
  'libboost-container-dev'
  'libboost-context-dev'
  'libboost-coroutine-dev'
  'libbrotli-dev'
  'libbsd-dev'
  'libcurl-dev'
  'liblowdown-dev'
  'librapidcheck-dev'
  'libseccomp-dev'
  'libsodium-dev'
  'libsqlite3-dev'
  'libssl-dev'
  'libtoml11-dev'
  'lowdown'
  'lsof'
  'meson>=1.4.0'
  'ninja-build'
  'nlohmann-json3-dev'
  'pkg-config'
  'python3'
  'tao-pegtl-dev'
)
depends_amd64=('libcpuid16')
depends=(
  'busybox-static'
  'curl'
  'libarchive13t64 | libarchive13'
  'libboost-container1.83.0 | libboost-container1.81.0'
  'libboost-context1.83.0 | libboost-context1.81.0'
  'libboost-coroutine1.83.0 | libboost-coroutine1.81.0'
  'libbrotli1'
  'libbsd0'
  'libcurl4t64 | libcurl4'
  'liblowdown1'
  'libseccomp2'
  'libsodium26 | libsodium23'
  'libsqlite3-0'
  'libssl3t64 | libssl3'
  'perl'
  'xz-utils'
)
# FIXME: tests are disabled since librapidcheck-dev is broken.
# Uncomment once the below PR is merged
# https://salsa.debian.org/debian/rapidcheck/-/merge_requests/1
#checkdepends=(
#  'libgmock-dev'
#  'libgtest-dev'
#  'librapidcheck-dev'
#)
pacdeps=(
  'coreutils-single'
  'libeditline-troglobit-git'
  'libgc-nix'
  'mdbook'
  'mdbook-linkcheck'
)

prepare() {
  cd lix
  cargo fetch --locked
}

build() {
  cd lix
  local mesonflags=(
    -Db_lto=true
    -Denable-docs=true
    -Denable-tests=false
    -Dgc=enabled
    -Dprefix=/usr
    -Dsandbox-shell=busybox
    -Dstate-dir=/nix/var
    -Dstore-dir=/nix/store
    -Dsysconfdir=/etc
  )
  meson setup build "${mesonflags[@]}"
  meson compile -C build
}

#check() {
#  cd lix
#  ninja test -j"${NCPU}" -C build
#}

package() {
  cd lix
  DESTDIR="${pkgdir}" meson install -C build
}
