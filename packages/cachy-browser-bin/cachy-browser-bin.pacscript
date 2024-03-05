name="cachy-browser-bin"
gives="cachy-browser"
pkgver="122.0-2"
repology=("project: ${gives}")
homepage='https://github.com/CachyOS/CachyOS-Browser-Settings'
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom"
maintainer="vigress8 <vig@disroot.org>"
arch=("amd64")
case $(
  /lib64/ld-linux-x86-64.so.2 --help \
    | grep 'x86-64.*supported' \
    | head -1 \
    | awk '{print $1}'
) in
  "x86-64_v4")
    source=("https://mirror.cachyos.org/repo/x86_64_v4/cachyos-v4/${gives}-${pkgver}-x86_64_v4.pkg.tar.zst")
    hash=("cbb922564695ae0d707d62bd7b95f7ae17e19404d3cbb71636210627004aebc8")
    ;;
  "x86-64_v3")
    source=("https://mirror.cachyos.org/repo/x86_64_v3/cachyos-v3/${gives}-${pkgver}-x86_64_v3.pkg.tar.zst")
    hash=("ef4802c010e6b7fd9bc5430f4bebb99bbc59f4bbc39ab891b8a75e192bc49436")
    ;;
  *)
    source=("https://mirror.cachyos.org/repo/x86_64/cachyos/${gives}-${pkgver}-x86_64.pkg.tar.zst")
    hash=("b2cbca172ee0f2033c4dd88bf789178bdb77bec689bd0eafffab639b76624c17")
    ;;
esac

package() {
  rm ./.{{BUILD,PKG}INFO,INSTALL,MTREE}
  sudo cp -r --preserve=mode,links ./* "${pkgdir}"
}
