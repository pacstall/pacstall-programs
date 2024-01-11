name="stockfish-git"
gives="stockfish"
pkgdesc="The Stockfish chess engine, built from the git repository"
homepage='https://stockfishchess.org/'
url="https://github.com/official-stockfish/Stockfish.git"
maintainer="pythoncrazy <encryptprogramming@gmail.com>"
pkgver="0.0.1"
breaks=("stockfish-git")
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build(){
  cd src
  make -j"${NCPU}" build
}

package() {
  cd src
  sudo make install BINDIR="${pkgdir}/usr/local/bin"
}
