name="timeshift"
repology=("project: timeshift")
version="22.06.1"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
url="https://github.com/linuxmint/timeshift/archive/refs/tags/v${version}.zip"
hash="a41be13aeb59b5792e167e30c7bcc4052750c4bdd28e22f309d674f790f52e4b"
build_depends="debhelper autotools-dev gzip valac libgtk-3-dev libgee-0.8-dev libjson-glib-dev libvte-2.91-dev"
depends="rsync btrfs-progs"
breaks="${name}-git ${name}-deb ${name}-bin ${name}-app"
replace="timeshift-btrfs"
description="Timeshift is a system restore utility which takes snapshots of the system at regular intervals. These snapshots can be restored at a later date to undo system changes. Creates incremental snapshots using rsync or BTRFS snapshots using BTRFS tools."

prepare()  {
    true
}

build() {
    sed -i -e 's/--Xcc="-O3" //g' src/makefile
    make -j"$(nproc)" all
}

install() {
    sudo make install DESTDIR="${STOWDIR}/${name}"
}
