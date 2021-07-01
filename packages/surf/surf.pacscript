name="surf"
version="2.1"
url="https://dl.suckless.org/$name/$name-$version.tar.gz"
build_depends="make"
depends="libc6 libgcr-base-3-1 libgcr-ui-3-1 libglib2.0-0 libgtk-3-0 libwebkit2gtk-4.0-37 libx11-6"
breaks="$name-git"
replace="$name"
description="$name is a simple web browser based on WebKit2/GTK+."
hash="72e582920ba25a646203e93c2d2331d87f03037a28894d6c7e99af00ee043257"
removescript="yes"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
          true
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/$name
          sudo install -Dm644 LICENSE -t /usr/src/pacstall/$name/usr/share/licenses/$name
          sudo install -Dm644 README -t /usr/src/pacstall/$name/usr/share/doc/$name
}

removescript(){
          sudo rm -rf /usr/share/licenses/$name
          sudo rm -rf /usr/share/doc/$name
}
