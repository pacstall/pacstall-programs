name="btrfs-du-bin"
gives="btrfs-du"
pkgver="0.0.7"
url="https://github.com/nachoparker/btrfs-du/archive/refs/tags/v${pkgver}.tar.gz"
pkgdesc="Easily print BTRFS subvolume/snapshot disk usage"
depends=("btrfs-progs")
repology=("project: ${gives}")

package() {
  sudo install -vDm755 -t "${pkgdir}/usr/bin" "btrfs-du"
}
