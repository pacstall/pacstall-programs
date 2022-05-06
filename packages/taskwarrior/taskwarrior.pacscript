name="taskwarrior"
pkgname="taskwarrior"
repology=("project: taskwarrior")
version="2.6.2"
url="https://github.com/GothenburgBitFactory/taskwarrior/releases/download/v${version}/task-${version}.tar.gz"
build_depends="g++ cmake git"
depends="libuuid1 gnutls-bin"
description="Taskwarrior is a command line task list management utility with a multitude of features, developed as a portable open source project with an active and quite vast ecosystem of tools, hooks and extensions."
hash="b1d3a7f000cd0fd60640670064e0e001613c9e1cb2242b9b3a9066c78862cfec"
maintainer="JonBoyleCoding <programmerfalcon@gmail.com>"

pkgdir="${STOWDIR}/${name}"

prepare() {
        true
}

build() {
        mkdir build
        cd build || exit
        cmake "../" -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
        make -j"$(nproc)"
}

install() {
        cd build || exit
        sudo make install
}
