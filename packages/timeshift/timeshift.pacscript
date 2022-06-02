name="timeshift"
repology=("project: timeshift")
version="22.06.1"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
url="https://github.com/teejee2008/timeshift/archive/refs/tags/v${version}.zip"
hash="ea808691f752bad4a83892cf57a07ce576f6e7a3bb1e3e32a0754fe8b0d070d7"
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
