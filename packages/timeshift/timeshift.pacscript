name="timeshift"
repology=("project: timeshift")
version="21.09.1"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
url="https://github.com/teejee2008/timeshift/archive/refs/tags/v${version}.zip"
hash="a82f8c41e18d41843b6604a6e70fd917f773561d7d569f5411ca2a0409e101bd"
build_depends="debhelper autotools-dev gzip valac libgtk-3-dev libgee-0.8-dev libjson-glib-dev libvte-2.91-dev"
depends="rsync btrfs-progs"
breaks="${name}-git ${name}-deb ${name}-bin ${name}-app"
replace="timeshift-btrfs"
description="Timeshift is a system restore utility which takes snapshots of the system at regular intervals. These snapshots can be restored at a later date to undo system changes. Creates incremental snapshots using rsync or BTRFS snapshots using BTRFS tools."

prepare()  {
    true
}

build() {
    make -j"$(nproc)" all
}

install() {
    sudo make install DESTDIR="${STOWDIR}/${name}"
}
