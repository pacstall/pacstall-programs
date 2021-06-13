#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="uwufetch"
version="1.4"
pkgdir="/usr/src/pacstall/${name}"
url="https://github.com/TheDarkBug/${name}/archive/refs/tags/${version}.zip"
description="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
build_depends="gcc pandoc"
optdepends=("viu: image preview"
"lshw: hardware info")
breaks="${name}-git ${name}-bin"
hash="062de9ec1af10ce5bccc5cd99ab72511883076c96d6ebb6f21647fb3486ca391"
removescript="yes"

prepare() {
  # Make nessesary directories
  sudo mkdir -p "${pkgdir}"/usr/bin
  sudo mkdir -p "${pkgdir}"/usr/lib
  sudo mkdir -p "${pkgdir}"/usr/share/man/man1
}

build() {
  # Build required files
  sudo make -j"$(nproc)" build DESTDIR="${pkgdir}"
  sudo make -j"$(nproc)" man DESTDIR="${pkgdir}"
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${name}/LICENSE"

  # Install doc
  sudo install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${name}"
  
  # Install uwufetch
  sudo make install DESTDIR="${pkgdir}"
}

removescript() {
  # Remove empty directories 
  rm -rf "/usr/share/licenses/${name}"
  rm -rf "/usr/share/doc/${name}"
}
# vim:set ft=sh ts=2 sw=2 et:
