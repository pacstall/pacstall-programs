name="stockfish-git"
gives="stockfish"
pkgdesc="The Stockfish chess engine"
homepage='https://stockfishchess.org/'
source=("https://github.com/official-stockfish/Stockfish.git")
maintainer="pythoncrazy <encryptprogramming@gmail.com>"
pkgver="0.0.1"
breaks=("stockfish-git")

build(){
  cd src
  make -j"${NCPU}" profile-build
}

package() {
  cd src
  make strip
  sudo make install BINDIR="${pkgdir}/usr/local/bin"
}
