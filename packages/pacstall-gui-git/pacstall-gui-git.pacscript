name="pacstall-gui-git"
pacdeps=("yad")
depends="sed adwaita-icon-theme policykit-1"
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
  sudo mkdir -p "${STOWDIR}/${name}/usr/bin" "${STOWDIR}/${name}/usr/lib/pacstall-gui"
}

build() {
  true
}

install() {
  sudo install -Dm755 pacstall-gui "${STOWDIR}/${name}/usr/bin/pacstall-gui"
  sudo mv -f ./settings.sh ./disable-root-check.diff "${STOWDIR}/${name}/usr/lib/pacstall-gui"
  sudo install -Dm755 LICENSE "${STOWDIR}/${name}/usr/share/licenses/pacstall-gui/LICENSE"
  sudo mv -f ./pacstall-gui.desktop "${STOWDIR}/${name}/usr/share/applications/pacstall-gui.desktop"
}

postinst() {
          sudo chmod -R a+w "${STOWDIR}/${name}/usr/lib/pacstall-gui"
          sudo update-desktop-database -q
}
