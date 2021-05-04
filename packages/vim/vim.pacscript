name="vim"
pkgname="vim"
version="8.2.2831"
url="https://github.com/vim/vim/archive/refs/tags/v8.2.2831.zip"
depends="libacl1 libc6 libcanberra0 libgpm2 libpython3.8 libselinux1 libtinfo6 vim-common vim-runtime"
gives="vim"
breaks="nvim"
hash="855f8759cfc6141145dfe629d13b792e90ee9c8e043f82407fcfc2164066fe23"

prepare() {
          cd src
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/vim
}
