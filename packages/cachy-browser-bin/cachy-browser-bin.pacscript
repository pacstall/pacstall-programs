pkgname="cachy-browser-bin"
gives="cachy-browser"
pkgver="123.0.1"
repology=("project: ${gives}")
homepage='https://github.com/CachyOS/CachyOS-Browser-Settings'
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom"
maintainer=("vigress8 <vig@disroot.org>")
arch=("amd64")

source=("https://mirror.cachyos.org/repo/x86_64/cachyos/${gives}-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=("946d37e51f8755c8c7d6da474e92283cddac12af819bc9dc7782a60ffa900b5b")
case $(
  /usr/lib/ld-linux-x86-64.so.2 --help |
    awk '/x86-64.*supported/ {print $1; exit}'
) in
  x86-64-v[34])
    source=("https://mirror.cachyos.org/repo/x86_64_v3/cachyos-v3/${gives}-${pkgver}-1-x86_64_v3.pkg.tar.zst")
    sha256sums=("f9b3ddca36a7d5e1eacb48cb2b0f7f542f1bd7f773b62b9cfd6316db43ea58ad")
    ;;
  *) ;;
esac

package() {
  cd "${_archive}"
  rm .BUILDINFO .INSTALL .MTREE .PKGINFO
  cp -r --preserve=mode,links ./* "${pkgdir}"
}
