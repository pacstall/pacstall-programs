name="youtube-dl-git"
pkgname="youtube-dl"
pkgdir="/usr/src/pacstall/${name}"
url="https://github.com/ytdl-org/youtube-dl.git"
description="Command-line program to download videos from YouTube.com and other video sites"
build_depends="make pandoc python3"
depends="python3"
maintainer="KwonNam Son <kwon37xi@gmail.com>"

pkgver() {
    # find latest tag name
    git ls-remote --sort='version:refname' --tags ${url} | grep -v '\^{}$' | tail --line=1 | cut --delimiter='/' --fields=3
}

version="$(pkgver)"

prepare() {
    git fetch --all --tags --prune
    git checkout "tags/${version}" -b "${version}"
}

build() {
    true
}

install() {
    sudo make install PREFIX="${pkgdir}/usr" PYTHON="/usr/bin/env python3"
}
