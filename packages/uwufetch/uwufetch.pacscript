#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="uwufetch"
version="1.6"
pkgdir="/usr/src/pacstall/${name}"
url="https://github.com/TheDarkBug/${name}/archive/refs/tags/${version}.zip"
description="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
build_depends="gcc"
optdepends=("viu: image preview"
"lshw: hardware info")
breaks="${name}-git ${name}-bin"
hash="6741bdc0f7f0ca4ebd46a38f02672d412086f7017242aff1f2bf4d872c417a9a"
removescript="yes"

prepare() {
  # Make nessesary directories
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/lib
  mkdir -p "${pkgdir}"/usr/share/man/man1
}

build() {
  # Build required files
  make -j"$(nproc)" build DESTDIR="${pkgdir}"
  make -j"$(nproc)" man DESTDIR="${pkgdir}"
}

install() {
  # Install license
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"

  # Install doc
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
  
  # Install uwufetch
  make install DESTDIR="${pkgdir}"
}

removescript() {
  # Remove empty directories 
  sudo rm -rf "/usr/share/licenses/${name}"
  sudo rm -rf "/usr/share/doc/${name}"
}
# vim:set ft=sh ts=2 sw=2 et:
