pkgname="dino-git"
source=("https://github.com/Elsie19/Dino.git")
arch=("any")
pkgver="0.1.1"
breaks=("dino" "dino-app" "dino-bin" "dino-deb")
gives="dino"
pkgdesc="An extensible database system written in Bash"
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "Dino"
  install -Dm755 dino "${pkgdir}/usr/bin/dino"
  install -D programs/* -t "${pkgdir}/usr/share/dino/programs"
  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
