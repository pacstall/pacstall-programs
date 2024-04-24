name="cachy-browser-bin"
gives="cachy-browser"
pkgver="125.0.1"
repology=("project: ${gives}")
homepage='https://github.com/CachyOS/CachyOS-Browser-Settings'
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom"
maintainer="vigress8 <vig@disroot.org>"
arch=("amd64")

url="https://mirror.cachyos.org/repo/x86_64/cachyos/${gives}-${pkgver}-1-x86_64.pkg.tar.zst"
hash="dfa769b0ead5a544502cb307e77c19a00ec3d4586ecc73c6e8cf213d79a68d73"
case $(
  /lib64/ld-linux-x86-64.so.2 --help |
    awk '/x86-64.*supported/ {print $1; exit}'
) in
  x86-64-v3)
    url="https://mirror.cachyos.org/repo/x86_64_v3/cachyos-v3/${gives}-${pkgver}-1-x86_64_v3.pkg.tar.zst"
    hash="641036b23aae69893db021f4f9e64a9f753b1c1ea4b7c067830a8b2b493ca616"
    ;;
  x86-64-v4)
    url="https://mirror.cachyos.org/repo/x86_64_v4/cachyos-v4/${gives}-${pkgver}-1-x86_64_v4.pkg.tar.zst"
    hash="fe9f4011305a5eb681a969ed3d39ea1f92667944d6079b15d9cff4a91ab7c29b"
    ;;
  *) ;;
esac

package() {
  rm .BUILDINFO .INSTALL .MTREE .PKGINFO
  sudo cp -r --preserve=mode,links ./* "${pkgdir}"
}
