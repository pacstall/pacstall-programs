#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="uwufetch"
arch=("any")
pkgver="2.1"
source=("@${pkgname}~${pkgver}::https://github.com/TheDarkBug/${pkgname}/archive/refs/tags/${pkgver}.zip")
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
makedepends=("gcc")
optdepends=("viu: image preview"
  "lshw: hardware info")
breaks=("${pkgname}-git" "${pkgname}-bin")
sha256sums=("92b1c07529aa91df990acb5a0f5ee4c8275c10d75ba305105b17f3931a5e4a8c")

prepare() {
  cd "${pkgname}~${pkgver}"
  # Make nessesary directories
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/lib
  mkdir -p "${pkgdir}"/usr/share/man/man1
}

build() {
  cd "${pkgname}~${pkgver}"
  # Build required files
  make -j"${NCPU}" build DESTDIR="${pkgdir}"
  make -j"${NCPU}" man DESTDIR="${pkgdir}"
}

package() {
  cd "${pkgname}~${pkgver}"
  # Install license
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install uwufetch
  make install DESTDIR="${pkgdir}"
}

# vim:set ft=sh ts=2 sw=2 et:
