name="btrfs-du-bin"
gives="btrfs-du"
version="0.0.7"
url="https://github.com/nachoparker/btrfs-du/archive/refs/tags/v${version}.tar.gz"
description="Easily print BTRFS subvolume/snapshot disk usage"
depends="btrfs-progs"
repology=("project: ${gives}")

install() {
    sudo install -vDm755 -t "$pkgdir/usr/bin" "btrfs-du"
}

# vim:set ft=sh ts=2 sw=2 et:
