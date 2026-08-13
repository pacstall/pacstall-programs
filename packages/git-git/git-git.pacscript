pkgname="git-git"
provides=("git")
replaces=("git")
breaks=("git")
pkgdesc="Fast, scalable, distributed revision control system"
url='https://git-scm.com/'
maintainer="CiccioBro17 <203853964+CiccioBro17@users.noreply.github.com>"
pkgver="0.r0"
arch=("any")
source=("git+https://github.com/git/git.git")
makedepends=(
  "build-essential"
  "dh-autoreconf"
  "cmake"
  "gcc"
  "libcurl4-gnutls-dev"
  "libexpat1-dev"
  "gettext"
  "libz-dev"
  "libssl-dev"
  "asciidoc"
  "xmlto"
  "docbook2x"
  "install-info"
  "zlib1g-dev"
  "zlib1g"
  "cargo>=1.49.0 | rustup"
  "git"
)

prepare() {
  cd "${srcdir}/git"
  make configure
}

build() {
  cd "${srcdir}/git"
  ./configure --prefix=/usr
  make -j"${NCPU}" all
}

package() {
  cd "${srcdir}/git"
  make install DESTDIR="${pkgdir}"
}
