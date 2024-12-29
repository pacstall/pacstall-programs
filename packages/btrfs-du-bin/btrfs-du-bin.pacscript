pkgname="btrfs-du-bin"
gives="btrfs-du"
arch=("amd64")
pkgver="0.0.7"
source=("@${pkgname}~${pkgver}::https://github.com/nachoparker/btrfs-du/archive/refs/tags/v${pkgver}.tar.gz")
pkgdesc="Easily print BTRFS subvolume/snapshot disk usage"
depends=("btrfs-progs")
repology=("project: ${gives}")

package() {
  cd "${pkgname}~${pkgver}"
  install -vDm755 -t "${pkgdir}/usr/bin" "btrfs-du"
}

# vim:set ft=sh ts=2 sw=2 et:
