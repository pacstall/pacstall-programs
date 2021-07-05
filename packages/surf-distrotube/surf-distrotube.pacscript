name="surf-distrotube"
pkgname="surf"
url="https://gitlab.com/dwt1/$name.git"
build_depends="make"
depends="libc6 libgcr-3-dev libglib2.0-dev libgtk-3-dev libwebkit2gtk-4.0-dev libx11-6"
breaks="$pkgname"
replace="$pkgname"
description="Heavily-patched customized build of the Suckless surf web browser."
hash="88a73c57558d0d30752184f517d0b6930133ab506383efd394b60d9a04e6513f"
removescript="yes"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
          true
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/$name
          sudo install -Dm644 LICENSE -t /usr/src/pacstall/$name/usr/share/licenses/$pkgname
          sudo install -Dm644 README.md -t /usr/src/pacstall/$name/usr/share/doc/$pkgname
}

removescript(){
          sudo rm -rf /usr/share/licenses/$pkgname
          sudo rm -rf /usr/share/doc/$pkgname
}
