pkgname="stockfish-git"
gives="stockfish"
pkgdesc="The Stockfish chess engine"
url='https://stockfishchess.org/'
source=("https://github.com/official-stockfish/Stockfish.git")
maintainer=("pythoncrazy <pinakpaliwal07@gmail.com>")
arch=("any")
pkgver="0.0.1"
pkgrel="2"
breaks=("stockfish-git")
external_connection="true"

build() {
  cd Stockfish/src
  make -j"${NCPU}" profile-build
}

package() {
  cd Stockfish/src
  make strip
  make install BINDIR="${pkgdir}/usr/local/bin"
}
