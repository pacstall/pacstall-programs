name="cachy-browser-bin"
gives="cachy-browser"
pkgver="121.0.1-1"
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
    url="https://mirror.cachyos.org/repo/x86_64_v4/cachyos-v4/${gives}-${pkgver}-x86_64_v4.pkg.tar.zst"
    hash="288f31900c8933922073c063f0c71995f668f0498365d02a4c232221d5f0ae2f"
    ;;
  "x86-64_v3")
    url="https://mirror.cachyos.org/repo/x86_64_v3/cachyos-v3/${gives}-${pkgver}-x86_64_v3.pkg.tar.zst"
    hash="576279ee63bc7fadc95b8b3e8a1bf3cac9aaff0e8dcf4d7cfbf2c11781d1399e"
    ;;
  *)
    url="https://mirror.cachyos.org/repo/x86_64/cachyos/${gives}-${pkgver}-x86_64.pkg.tar.zst"
    hash="b58216b879a2583673e0c7f77d7646606760177ad4f87ef0f7ea6849d001935f"
    ;;
esac

package() {
  rm ./.{{BUILD,PKG}INFO,INSTALL,MTREE}
  sudo cp -r --preserve=mode,links ./* "${pkgdir}"
}
