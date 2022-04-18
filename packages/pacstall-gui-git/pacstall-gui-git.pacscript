name="pacstall-gui-git"
url="https://github.com/cat-master21/pacstall-gui.git"
breaks="${gives} ${gives}-bin ${gives}-deb"
gives="pacstall-gui"
description="A gui for Pacstall written in bash."
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"

pkgver() {
  git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 pacstall-gui /usr/src/pacstall/pacstall-gui-git/usr/bin/pacstall-gui
  sudo mv -f ./settings.sh ./disable-root-check.diff /usr/src/pacstall/pacstall-gui-git/usr/lib/pacstall-gui
  sudo install -Dm755 LICENSE /usr/src/pacstall/pacstall-gui-git/usr/share/licenses/pacstall-gui/LICENSE
}

postinst() {
          sudo chmod -R a+w /usr/src/pacstall/pacstall-gui-git/usr/lib/pacstall-gui
}
