pkgname="taskwarrior"
gives="taskwarrior"
repology=("project: taskwarrior")
arch=("any")
pkgver="2.6.2"
source=("@${pkgname}~${pkgver}::https://github.com/GothenburgBitFactory/taskwarrior/releases/download/v${pkgver}/task-${pkgver}.tar.gz")
makedepends=("g++" "cmake" "git")
depends=("uuid-dev" "gnutls-dev")
pkgdesc="Taskwarrior is a command line task list management utility with a multitude of features, developed as a portable open source project with an active and quite vast ecosystem of tools, hooks and extensions."
sha256sums=("b1d3a7f000cd0fd60640670064e0e001613c9e1cb2242b9b3a9066c78862cfec")
maintainer=("JonBoyleCoding <programmerfalcon@gmail.com>")
breaks=("taskwarrior-app" "taskwarrior-deb" "taskwarrior-bin" "taskwarrior-git")
replaces=("taskwarrior")

build() {
  cd "${pkgname}~${pkgver}"
  mkdir build
  cd build || exit
  cmake "../" -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install

  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/bash/task.sh" "${pkgdir}/usr/share/bash-completion/completions/task"
  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/fish/task.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/task.fish"

  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/ftdetect/task.vim" "${pkgdir}/usr/share/vim/vimfiles/ftdetect/task.vim"
  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/syntax/taskdata.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/taskdata.vim"
  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/syntax/taskedit.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/taskedit.vim"
  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/syntax/taskrc.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/taskrc.vim"

  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/task/LICENSE"
}
