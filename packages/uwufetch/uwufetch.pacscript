#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="uwufetch"
pkgver="1.7"
source=("https://github.com/TheDarkBug/${pkgname}/archive/refs/tags/${pkgver}.zip")
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
makedepends=("gcc")
optdepends=("viu: image preview"
  "lshw: hardware info")
breaks=("${pkgname}-git" "${pkgname}-bin")
sha256sums=("1f2f4b17c368e4e097323afc14386b30d6c7b7aa626565ef6902ff6e37b34dab")

prepare() {
  cd "${_archive}"
  # Make nessesary directories
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/lib
  mkdir -p "${pkgdir}"/usr/share/man/man1
}

build() {
  cd "${_archive}"
  # Build required files
  make -j"${NCPU}" build DESTDIR="${pkgdir}"
  make -j"${NCPU}" man DESTDIR="${pkgdir}"
}

package() {
  cd "${_archive}"
  # Install license
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install uwufetch
  make install DESTDIR="${pkgdir}"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
