name="osh"
pkgdir="${STOWDIR}/${name}"
version="0.9.5"
description="Oil Shell - A bash-compatible UNIX shell written in Python"
url="https://www.oilshell.org/download/oil-${version}.tar.xz"
gives="oil"
breaks="${name}-bin ${name}-git ${name}-deb ${name}-app"
hash="d89d8c081c8bc536dfc7b437b965a265c07e24cf5142ff26b21b4cc4a3139e32"

# Edit MAKEFLAGS here
MAKEFLAGS=

prepare() {
  mkdir -p tmp

  # HACK: Change `TMP` directory to `./tmp/` for building
  # We do not want this to expand
  # shellcheck disable=SC2016
  sed 's/TMP=${TMPDIR:-\/tmp}/TMP=.\/tmp/' -i "configure"

  # HACK: Change `DESTDIR` by inserting it directly into the file
  #       Since `DESTDIR="${pkgdir}/ sudo ./install" doesn't work
  sed "2 i DESTDIR=${pkgdir}" -i "./install"
}

build() {
  ./configure --prefix="/usr"

  # We want this to expand
  # shellcheck disable=SC2248
  make -j"$(nproc)" ${MAKEFLAGS}
}

install() {
  sudo ./install
}
# vim:set ft=sh ts=2 sw=2 et:
