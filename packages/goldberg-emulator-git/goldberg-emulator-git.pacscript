pkgname="goldberg-emulator-git"
gives="goldberg-emulator"
pkgver="0.2.5"
pkgdesc="Emulator for Steam online features"
makedepends=('automake' 'autotools-dev' 'build-essential' 'g++-multilib' 'gcc-multilib' 'git' 'libprotobuf-dev' 'libtool' 'protobuf-compiler')
arch=('amd64')
url='https://gitlab.com/Mr_Goldberg/goldberg_emulator'
incompatible=('*:bookworm')
source=(
  "${gives}::https://gitlab.com/Mr_Goldberg/goldberg_emulator.git"
  "https://github.com/protocolbuffers/protobuf.git#branch=21.x"
  "fix_build.patch::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/merge_requests/42.patch"
)
sha256sums=(
  'SKIP' 'SKIP'
  '2fa79bb1526b2903c4b95f4e534c9627367d9a9acba35d22c190f0a04c35f381'
)
repology=("project: ${gives}")

prepare() {
  cd "${srcdir}/${gives}"
  patch -sp1 < ../fix_build.patch

  # Use system-provided protobuf for 64-bit build.
  sed \
    -e '/-m32/! s| -I.*include/ -L.*lib/||g' \
    -e '/x86/! s|^.*protoc|protoc|' \
    -e 's|std=c++14|std=c++17|g' \
    -i build_steamos.sh

  # Remove nasty carriage returns.
  sed -i 's|\r$||' sdk_includes/*.h
}

build() {
  export PS4='+ '
  # Build 32-bit protobuf, since the deb conflicts with the 64-bit one.
  pushd > /dev/null "${srcdir}/protobuf"
  ./autogen.sh
  ./configure \
    CC="gcc -m32" \
    CXX="g++ -m32" \
    {CPPFLAGS,CXXFLAGS}="-fPIC -Ofast" \
    --prefix="${PWD}/prefix_x86/" \
    --disable-shared \
    --enable-static
  make -j"${NCPU}" install clean
  popd > /dev/null

  cd "${srcdir}/${gives}"
  sh -x build_steamos.sh
}

package() {
  cd "${srcdir}/${gives}"

  install -Dm755 -t "${pkgdir}/usr/lib" linux/x86_64/*.so
  install -Dm755 -t "${pkgdir}/usr/lib32" linux/x86/*.so
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/${gives}"
  install -d "${pkgdir}/usr/share/doc/${gives}"
  install -d "${pkgdir}/usr/include/${gives}/steam"
  chmod 755 linux/{lobby_connect,tools}/*
  cp -r linux/{lobby_connect,tools} \
    "${pkgdir}/usr/share/${gives}/"
  cp -r README.md files_example \
    "${pkgdir}/usr/share/doc/${gives}/"
  cp sdk_includes/*.h \
    "${pkgdir}/usr/include/${gives}/steam/"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"

  (
    shopt -s failglob

    local exe bname
    # Symlink all executables to /usr/bin with a goldberg- prefix.
    cd "${pkgdir}/usr/share/${gives}"
    for exe in {lobby_connect,tools}/*; do
      exe="${exe#"${pkgdir}"}"
      bname="${exe##*/}"
      bname="${bname//_/-}"
      ln -sfv "${exe}" "${pkgdir}/usr/bin/goldberg-${bname%.sh}"
    done
  )
}
