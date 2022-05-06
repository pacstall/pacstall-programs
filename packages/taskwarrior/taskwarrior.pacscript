name="taskwarrior"
pkgname="taskwarrior"
repology=("project: taskwarrior")
version="2.6.2"
url="https://github.com/GothenburgBitFactory/taskwarrior/releases/download/v${version}/task-${version}.tar.gz"
build_depends="g++ cmake git"
depends="libuuid1 gnutls-dev"
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
        sudo make install

        sudo install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/bash/task.sh" "${pkgdir}/usr/share/bash-completion/completions/task"
        sudo install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/fish/task.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/task.fish"

        sudo install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/ftdetect/task.vim" "${pkgdir}/usr/share/vim/vimfiles/ftdetect/task.vim"
        sudo install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/syntax/taskdata.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/taskdata.vim"
        sudo install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/syntax/taskedit.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/taskedit.vim"
        sudo install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/syntax/taskrc.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/taskrc.vim"

        sudo install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/task/LICENSE"
}

removescript() {
        sudo rm -rf "/usr/share/bash-completion/completions/task"
        sudo rm -rf "/usr/share/fish/vendor_completions.d/task.fish"

        sudo rm -rf "/usr/share/vim/vimfiles/ftdetect/task.vim"
        sudo rm -rf "/usr/share/vim/vimfiles/syntax/taskdata.vim"
        sudo rm -rf "/usr/share/vim/vimfiles/syntax/taskedit.vim"
        sudo rm -rf "/usr/share/vim/vimfiles/syntax/taskrc.vim"

        sudo rm -rf "/usr/share/licenses/task/LICENSE"
}
