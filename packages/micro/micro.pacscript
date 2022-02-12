name="micro"
pkgname="micro"
version="2.0.10"
description="A modern and intuitive terminal-based text editor."
maintainer="edward-riley <edward@edwardriley.co.uk>"
url="https://github.com/zyedidia/micro/releases/download/v${version}/micro-${version}-linux64.tar.gz"
build_depends="build-essential"
gives="micro"
breaks="micro"
hash="98797d745aec85b36a9cedc87ce7656adcd8cc94c909a07edeb6e61538418bed"
prepare() {
}

build() {
    chmod +x "./micro"
}

install() {
    sudo install -Dm644 micro "/usr/src/pacstall/micro/usr/bin/micro"
    tar -czf "micro.1.tar.gz" "micro.1"
    sudo install -Dm644 micro.1.tar.gz "/usr/src/pacstall/micro/usr/share/man/man1/micro.1.tar.gz"
    sudo install -Dm644 "./micro.svg" "/usr/src/pacstall/micro/usr/share/pixmaps/micro.svg"
    sudo install -Dm644 micro.desktop "/usr/src/pacstall/micro/usr/share/applications/micro.desktop"
}
