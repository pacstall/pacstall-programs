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
    sudo mkdir -p "/usr/src/pacstall/micro/usr/bin" "/usr/src/pacstall/micro/usr/share/man/man1" "/usr/src/pacstall/micro/usr/share/applications"
}

build() {
    chmod +x "./micro"
}

install() {
    sudo install -Dm644 micro "/usr/src/pacstall/micro/usr/bin/micro"
    tar -czf "micro.1.tar.gz" "micro.1"
    sudo cp micro.1.tar.gz "/usr/src/pacstall/micro/usr/share/man/man1"
    sudo install -Dm644 "./micro.svg" "/usr/src/pacstall/micro/usr/share/pixmaps/micro.svg"
    sudo cp "micro.desktop" "/usr/src/pacstall/micro/usr/share/applications"
}
