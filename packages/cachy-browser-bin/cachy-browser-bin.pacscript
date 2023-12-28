name="cachy-browser-bin"
gives="cachy-browser"
pkgver="121.0-1"
repology=("project: ${gives}")
homepage='https://github.com/CachyOS/CachyOS-Browser-Settings'
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom"
maintainer="vigress8 <vig@disroot.org>"
arch=("amd64")
gnuarch="x86_64"
case $(
  /lib64/ld-linux-x86-64.so.2 --help \
    | grep 'x86-64.*supported' \
    | head -1 \
    | awk '{print $1}'
) in
  "x86-64_v4")
    url="https://mirror.cachyos.org/repo/x86_64_v4/cachyos-v4/${gives}-${pkgver}-x86_64_v4.pkg.tar.zst"
    hash="681e45f95d7539d5d174763fed98fd00a00d0f3639cb2e6a2eb543cc41108019"
    ;;
  "x86-64_v3")
    url="https://mirror.cachyos.org/repo/x86_64_v3/cachyos-v3/${gives}-${pkgver}-x86_64_v3.pkg.tar.zst"
    hash="c8fc910c201b7260c1bba02729cf886d005fca1b7a7ea78949d9ea4b65277ba8"
    ;;
  *)
    pkgver="120.0.1-3"
    url="https://mirror.cachyos.org/repo/x86_64/cachyos/${gives}-${pkgver}-x86_64.pkg.tar.zst"
    hash="6cb1dcb6f7962cd302af61dcee3c52c33d81417b20d72bbe31b30b4d217d1946"
    ;;
esac

package() {
  rm ./.{{BUILD,PKG}INFO,INSTALL,MTREE}
  sudo cp -r --preserve=mode,links ./* "${pkgdir}"
}
