maintainer="pythoncrazy <encryptprogramming@gmail.com>"

name="stockfish-git"
pkgname="stockfish-git"
pkgdesc="The Stockfish chess engine, built from the git repository"
homepage='https://stockfishchess.org/'
url="https://github.com/official-stockfish/Stockfish.git"
pkgver="0.0.1"
gives="${pkgname}"
breaks=("${pkgname}")
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
