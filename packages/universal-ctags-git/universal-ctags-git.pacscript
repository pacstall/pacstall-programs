name="universal-ctags-git"
pkgname="universal-ctags"
pkgdir="/usr/src/pacstall/${name}"
url="https://github.com/universal-ctags/ctags.git"
description="Universal Ctags (abbreviated as u-ctags) is a maintained implementation of ctags. ctags generates an index (or tag) file of language objects found in source files for programming languages. This index makes it easy for text editors and other tools to locate the indexed items."
build_depends="gcc make pkg-config autoconf automake python3-docutils libseccomp-dev libjansson-dev libyaml-dev libxml2-dev"
maintainer="KwonNam Son <kwon37xi@gmail.com>"

pkgver() {
    # find latest tag name
    git ls-remote --sort='version:refname' --tags ${url} | tail --line=1 | cut --delimiter='/' --fields=3
}

version="$(pkgver)"

prepare() {
    git fetch --all --tags --prune
    git checkout tags/$version -b $version
    ./autogen.sh
}

build() {
    ./configure --prefix="${pkgdir}/usr" --program-transform-name='s/ctags/ctags-universal/'
    make -j$(nproc)

}

install() {
    sudo make install
}

postinst() {
    sudo update-alternatives \
            --install /usr/bin/ctags ctags /usr/bin/ctags-universal 30 \
            --slave /usr/share/man/man1/ctags.1 ctags.1.gz /usr/share/man/man1/ctags-universal.1
}

removescript() {
    sudo update-alternatives --remove ctags /usr/bin/ctags-universal
}
