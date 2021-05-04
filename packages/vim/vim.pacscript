name="vim"
pkgname="vim"
version="8.2.2831"
url="https://github.com/vim/vim/archive/refs/tags/v8.2.2831.zip"
depends="libacl1 libc6 libcanberra0 libgpm2 libpython3.8 libselinux1 libtinfo6 vim-common vim-runtime"
gives="vim"
breaks="nvim"

prepare() {
          cd src
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/vim
}
