name="vim"
pkgname="vim"
version="8.2.3434"
url="https://github.com/vim/vim/archive/refs/tags/v8.2.3434.tar.gz"
depends="libacl1 libc6 libcanberra0 libgpm2 libpython3.8 libselinux1 libtinfo6 vim-common vim-runtime libncurses-dev"
gives="vim"
breaks="nvim"
hash="a983c453fdf45f4e0da09cb36f0041667d4b542f647823a3dea23bbae512ffd1"

prepare() {
          cd src
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/vim
}
