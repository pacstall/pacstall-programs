name="vim"
pkgname="vim"
version="8.2.5056"
url="https://github.com/vim/vim/archive/refs/tags/v${version}.tar.gz"
depends="libacl1 libc6 libcanberra0 libgpm2 libpython3-dev libselinux1 libtinfo6 vim-common vim-runtime libncurses-dev"
gives="vim"
breaks="nvim"
hash="2a7ed006ba7c6af3210525606444a9c4bd45efb467e9df045eabc5a09bc428f9"
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
