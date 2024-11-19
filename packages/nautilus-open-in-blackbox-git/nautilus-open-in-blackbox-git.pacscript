pkgname="nautilus-open-in-blackbox-git"
gives="nautilus-open-in-blackbox"
arch=("any")
pkgver="0.1.1"
source=("https://github.com/ppvan/nautilus-open-in-blackbox.git")
pkgdesc="Open current directory in BlackBox from Nautilus context menu"
maintainer=("Anifyuli <anifyuliansyah@gmail.com>")
depends=("python3-nautilus")

package() {
  cd "nautilus-open-in-blackbox"
  install -Dm644 -t "${pkgdir}/usr/share/nautilus-python/extensions" nautilus-open-in-blackbox.py
}

# vim:set ft=sh ts=2 sw=2 et:
