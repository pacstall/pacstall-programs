pkgname="taskwarrior"
gives="taskwarrior"
repology=("project: taskwarrior")
arch=("any")
pkgver="3.4.1"
source=("@${pkgname}~${pkgver}::https://github.com/GothenburgBitFactory/taskwarrior/releases/download/v${pkgver}/task-${pkgver}.tar.gz")
makedepends=("g++" "cmake" "git" "uuid-dev" "gnutls-dev" "cargo>=1.81.0")
pkgdesc="Command line task list management utility with a multitude of features, developed as a portable open source project with an active and quite vast ecosystem of tools, hooks and extensions"
sha256sums=("23eb60f73e42f16111cc3912b44ee12be6768860a2db2a9c6a47f8ac4786bac3")
maintainer=("JonBoyleCoding <programmerfalcon@gmail.com>")
breaks=("taskwarrior-app" "taskwarrior-deb" "taskwarrior-bin" "taskwarrior-git")
replaces=("taskwarrior")
external_connection=true

build() {
  cd "${pkgname}~${pkgver}"
  cargo build -j"${NCPU}" --release --locked
  cmake -DCMAKE_INSTALL_PREFIX="/usr" .
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/bash/task.sh" "${pkgdir}/usr/share/bash-completion/completions/task"
  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/fish/task.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/task.fish"

  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/ftdetect/task.vim" "${pkgdir}/usr/share/vim/vimfiles/ftdetect/task.vim"
  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/syntax/taskdata.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/taskdata.vim"
  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/syntax/taskedit.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/taskedit.vim"
  install -Dm644 "${pkgdir}/usr/share/doc/task/scripts/vim/syntax/taskrc.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/taskrc.vim"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/task/LICENSE"
}
