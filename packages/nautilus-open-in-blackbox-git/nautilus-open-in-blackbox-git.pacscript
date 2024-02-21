name="nautilus-open-in-blackbox-git"
gives="nautilus-open-in-blackbox"
pkgver="0.1.1"
pkgrel="1"
arch='any'
url="https://github.com/ppvan/nautilus-open-in-blackbox.git"
pkgdesc="Open current directory in BlackBox from Nautilus context menu"
maintainer="Anifyuli <anifyuliansyah@gmail.com>"
depends=("python3-nautilus")
makedepends=('git')
pkgver() {
  git ls-remote "${url}" main | head -n1 | cut -f1 | cut -c1-8
}
package() {
  cd "$name-$pkgver"
  sudo install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions" nautilus-open-in-blackbox.py
}

# vim:set ft=sh ts=2 sw=2 et:
