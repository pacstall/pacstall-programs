pkgname='lix-git'
gives='lix'
arch=("any")
pkgver='2.90'
pkgdesc='A modern, delicious implementation of the Nix package manager, focused on correctness, usability, and growth'
url='https://lix.systems'
source=('lix::https://github.com/lix-project/lix.git')
repology=('project: lix-nix')
conflicts=('lix' 'nix-bin' 'nix-setup-systemd')
external_connection='true'
makedepends_amd64=('libcpuid-dev')
makedepends=(
  'bison'
  'busybox-static'
  'cargo'
  'cmake'
  'doxygen'
  'flex'
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
  'meson'
  'ninja-build'
  'nlohmann-json3-dev'
  'pkg-config'
  'python3'
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
#checkdepends=(
#  'libgmock-dev'
#  'libgtest-dev'
#  'librapidcheck-dev'
#)
pacdeps=(
  'coreutils-single'
  'libeditline-troglobit'
  'libgc-nix'
  'mdbook'
  'mdbook-linkcheck'
)

prepare() {
  cd lix
  sed -i '1c #!/usr/bin/env bash' \
    doc/manual/process-includes.sh \
    doc/manual/render-manpage.sh \
    tests/functional/install-darwin.sh
  env -C lix-doc CARGO_HOME=crates \
    cargo fetch --locked
}

build() {
  cd lix
  env -C lix-doc CARGO_HOME=crates \
    cargo build -j"${NCPU}" --release --offline
  export LIBRARY_PATH=${PWD}/lix-doc/target/release

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
    #-Dtests-brief=true
  )
  meson setup build "${mesonflags[@]}"
  ninja -j"${NCPU}" -C build
}

#check() {
#  cd lix
#  ninja test -j"${NCPU}" -C build
#}

package() {
  cd lix
  DESTDIR="${pkgdir}" ninja install -C build
}
