name="vim"
pkgname="vim"
version="8.2.5052"
url="https://github.com/vim/vim/archive/refs/tags/v${version}.tar.gz"
depends="libacl1 libc6 libcanberra0 libgpm2 libpython3.8 libselinux1 libtinfo6 vim-common vim-runtime libncurses-dev"
gives="vim"
breaks="nvim"
hash="e96be06c4955cd5b75f0ea026d7845e136d435b9e7621f9534a1034c1a0ca724"

prepare() {
          cd src
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/vim
}
