# Based on Sam Kirby <sam.kirby94@hotmail.co.uk> PKGBUILD

pkgname="xmonad-git"
pkgver="0.17.0.r24.ge25d090"
gives="xmonad"
pkgdesc="Lightweight X11 tiled window manager written in Haskell"
arch=('amd64')
url="http://xmonad.org/"
maintainer=("aKqir24 <aKqir24@github.com>")
license=('BSD-3-Clause')
depends=(
  'ghc'
  'libghc-x11-dev'
  'libghc-mtl-dev'
  'libghc-utf8-string-dev'
  'libghc-extensible-exceptions-dev'
  'libghc-setlocale-dev'
)
makedepends=(
  'git'
  'haskell-stack'
  'libx11-dev'
  'libxinerama-dev'
  'libxrandr-dev'
  'libxss-dev'
  'libxft-dev'
)
conflicts=("${gives}")
provides=("${gives}")
source=(
  "git+https://github.com/xmonad/xmonad.git"
  "12.yaml::https://files.catbox.moe/yhpni5.yaml"
  "stack-setup-2.yaml::https://files.catbox.moe/y57e5d.yaml"
  "xmonad.desktop::https://files.catbox.moe/dfm0qr.desktop"
  "xmonad.svg::https://aur.archlinux.org/cgit/aur.git/plain/xmonad.svg?h=xmonad-git"
  "dynamic-compilation.patch::https://aur.archlinux.org/cgit/aur.git/plain/dynamic-compilation.patch?h=xmonad-git"
)
external_connection=true

prepare() {
  cd "${gives}"
  patch -p1 -i "${srcdir}/dynamic-compilation.patch"
}

build() {
  cd "${srcdir}/${gives}"

  # Initialize stack and compile the binary cleanly
  stack setup
  export STACK_SETUP_INFO_YAML="${srcdir}/stack-setup-2.yaml"
  stack build \
    --snapshot "${srcdir}/12.yaml" \
    --local-bin-path="${srcdir}/bin" --copy-bins
}

package() {
  cd "${srcdir}/${gives}" || return 1

  # Install the compiled standalone binary directly
  install -Dm 755 "${srcdir}/bin/xmonad" "${pkgdir}/usr/bin/xmonad"

  # Install documentation, man pages, and assets
  install -Dm 644 man/xmonad.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/xmonad"
  install -Dm 644 "${srcdir}/xmonad.svg" -t "${pkgdir}/usr/share/pixmaps"

  # Generate the desktop entry directly
  mkdir -p "${pkgdir}/usr/share/xsessions"
  cp "${srcdir}/xmonad.desktop" "${pkgdir}/usr/share/xsessions/xmonad.desktop"
}
