name="vim"
pkgname="vim"
version="8.2.5054"
url="https://github.com/vim/vim/archive/refs/tags/v${version}.tar.gz"
depends="libacl1 libc6 libcanberra0 libgpm2 libpython3-dev libselinux1 libtinfo6 vim-common vim-runtime libncurses-dev"
gives="vim"
breaks="nvim"
hash="2c7e6d72c368b4de0317ea75e1798f25644cd3bdf700f1e117971cc1a06080b3"
repology=("project: vim")

prepare() {
          cd src
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/vim
}
