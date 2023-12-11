name="penguins-eggs-deb"
arch=("amd64" "i386" "arm64")
gives="penguins-eggs"
pkgver="9.6.21"
homepage="https://penguins-eggs.net/"
pkgdesc="On the road of Remastersys, Refracta, Systemback and father Knoppix!"
maintainer="Anifyuli <anifyuliansyah@gmail.com>"
case "${CARCH}" in
  amd64)
    hash="4f794a8dbe983dd710313e584dab9017b79b45ab86f06e2548e5d4bdd6c2af64"
    ;;
  arm64)
    hash="59fc8840bae60686e367eb96f89acddc8c42e2a773ea0b04ed601fcda1846ccb"
    ;;
  i386)
    hash="81c956a68a2e7e4cf9d8e74fb28149cc821a919741a732c78df1181525a8128c"
    ;;
  *) return 1 ;;
esac
url="https://sourceforge.net/projects/${gives}/files/DEBS/eggs_${pkgver}_${CARCH}.deb"
