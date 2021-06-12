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
gives="${name}"
breaks="${name}-git ${name}-bin"
hash="062de9ec1af10ce5bccc5cd99ab72511883076c96d6ebb6f21647fb3486ca391"

prepare() {
  sudo mkdir -p "${pkgdir}"/usr/bin
  sudo mkdir -p "${pkgdir}"/usr/lib
  sudo mkdir -p "${pkgdir}"/usr/share/man/man1
}

build() {
  sudo make -j"$(nproc)" build DESTDIR="${pkgdir}"
  sudo make -j"$(nproc)" man DESTDIR="${pkgdir}"

}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
