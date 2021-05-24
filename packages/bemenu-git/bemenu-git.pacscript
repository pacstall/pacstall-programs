#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"
url="https://github.com/Cloudef/bemenu.git"
pkgver() {
    git ls-remote "${url}" master | sed "s/refs\/heads\/.*//"
}
name="bemenu-git"
pkgname="bemenu"
version="$(pkgver)"
description="Dynamic menu library and client program inspired by dmenu"
build_depends="libxinerama-dev libxkbcommon-dev libncurses-dev wayland-protocols libwayland-dev libcairo2-dev libpango1.0-dev libpangocairo-1.0-0"
gives="bemenu"
breaks="bemenu-bin"



prepare() {
    true
}

build() {
    make -j"$(nproc)"
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/"${name}"
}
