name="vim"
pkgname="vim"
version="8.2.3189"
url="https://github.com/vim/vim/archive/refs/tags/v8.2.3189.zip"
depends="libacl1 libc6 libcanberra0 libgpm2 libpython3.8 libselinux1 libtinfo6 vim-common vim-runtime libncurses-dev"
gives="vim"
breaks="nvim"
hash="982285ae3a92146ac75f37368679a468330f5218ded440e8730d90c506744621"

prepare() {
          cd src
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/vim
}
