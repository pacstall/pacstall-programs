name="pacstall-gui-git"
pacdeps=("yad")
depends=("sed" "adwaita-icon-theme" "policykit-1" "desktop-file-utils")
url="https://github.com/cat-master21/pacstall-gui.git"
breaks=("${gives}" "${gives}-bin" "${gives}-deb")
gives="pacstall-gui"
description="A gui for Pacstall written in bash."
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

prepare() {
  sudo mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/pacstall-gui" "${pkgdir}/usr/share/applications"
}

install() {
  sudo install -Dm755 pacstall-gui "${pkgdir}/usr/bin/pacstall-gui"
  sudo mv -f ./settings.sh "${pkgdir}/usr/lib/pacstall-gui"
  sudo install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/pacstall-gui/LICENSE"
  sudo mv -f ./pacstall-gui.desktop "${pkgdir}/usr/share/applications"
}

postinst() {
  sudo chmod -R a+w "${pkgdir}/usr/lib/pacstall-gui"
  sudo update-desktop-database -q
}
